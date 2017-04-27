# spdz-deployment
Store artifacts to manage deployment of SPDZ engines. Deploy scripts, Docker files, instructions.

Separated out from spdz repo to avoid polluting with non core files.

## Docker support
SPDZ engines are deployed in Docker containers using the following Docker files.

A Dockerhub id for spdz has been created, currently personal to jon.evans@bristol.ac.uk, could move to be an organisation account.

The docker images are built locally, tagged and then pushed to hub.docker.com. Using:

```
docker login
docker push spdz/<reponame>:<tagname>
``` 

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

Convenience container to mount the SPDZ source files from the host file system into a container to allow interactive dev and testing, e.g. on MacOS.

Build with `docker build -f Dockerfile-spdz-dev -t spdz/spdzdev .`

Run with 

```
docker run -it --rm -p 14000-14010:14000-14010 -v <location of spdz on host directory>:/spdz spdz/spdzdev
```

`Dockerfile-spdz-preprocess`

Generate pre processing material to be used by SPDZ parties. See Scripts/distribute-preprocess.sh to send out generated values.

`Dockerfile-spdz-keymaterial`

Generate the SPDZ party server DH key pair used to secure client communication.

`Dockerfile-workshop-voting`

Example of building a specific SPDZ program to deploy. Note compiles mpc program from buildtemp directory.
