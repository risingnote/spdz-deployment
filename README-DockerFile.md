## Dockerfiles explained
SPDZ demonstrator applications are deployed as Docker containers. The Docker files listed here are used to build SPDZ related containers and are stored separately from the https://github.com/bristolcrypto/SPDZ repo to avoid polluting it with deploy specific files. The other demonstrator related components are built using Docker files stored in the relevant repos, e.g. https://github.com/bristolcrypto/spdz-proxy.

A Dockerhub id for spdz has been created, currently personal to jon.evans@bristol.ac.uk but it could be moved to be an organisation account. All images are public although the SPDZ source has been removed after the build.

The docker images are built locally, tagged and then pushed to https://hub.docker.com/u/spdz/. Using:

```
docker login
docker push spdz/<reponame>:<tagname>
``` 

Tagging of docker images aims to fix the docker image to a git tag version in the code base. A suggested approach is to use:
- git_tag if building from a release tag
- git_tag_snapshot if building from a working copy which has changes since the last tag

## Docker files

`Dockerfile-gcc`

Builds on Centos 7 latest and installs gcc 6.2.

Build with `docker build -f Dockerfile-gcc -t spdz/gcc:6.2 .` Use as many cores as possible to speed up build time.

`Dockerfile-spdz-libs`

Installs library dependencies for SPDZ

Build with `docker build -f Dockerfile-spdz-libs -t spdz/libs:latest .`

`Dockerfile-spdz`

Copies the source files into a container and builds SPDZ, no MPC compilation.

Ensure that the correct version of spdz is available in the spdz subdirectory.

Build with `docker build -f Dockerfile-spdz -t spdz/spdz .`

`Dockerfile-spdz-dev`

Convenience container to mount the SPDZ source files from the host file system into a container to allow interactive dev and testing, e.g. on MacOS. Installs the python dependencies to allow the Scripts/test.sh tests to be run.

Build with `docker build -f Dockerfile-spdz-dev -t spdz/spdzdev .`

Run with 

```
docker run -it --rm -p 14000-14010:14000-14010 -v <location of spdz on host directory>:/spdz spdz/spdzdev
```

`Dockerfile-spdz-preprocess`

Generate fake pre processing material to be used by SPDZ parties. See Scripts/distribute-preprocess.sh for example script to distribute the generated values.

`Dockerfile-spdz-keymaterial`

Generate the SPDZ party server DH key pair used to secure client communication. Copy the generated SPDZ-Keys to Player-Data/n-128-40/Player-SPDZ-Keys-Pn where n is in {0,1,...,number of parties - 1}. The public key needs to be recorded and stored in GUI config, as it is used to secure communications between external clients and SPDZ engines.

`Dockerfile-spdz-startup`

Runs the Server.x program to coordinate startup of SPDZ engines run using the Player-Online.x program.

`Dockerfile-workshop-voting, Dockerfile-bankers-bonus`

Compile a specific mpc program and set up for deploy time run of a single SPDZ engine. Note that the mpc program is compiled from the buildtemp directory, so copy here first. This is because the .dockerignore file is setup to exclude mpc programs from the Dockerfile-spdz build and it has the same effect here.
