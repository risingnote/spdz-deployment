# spdz-deployment
Store artifacts to manage deployment of SPDZ engines. Deploy scripts, Docker files, instructions.

Separated out from spdz repo to avoid polluting with non core files.

## Docker support
SPDZ engines are deployed in Docker containers using the following Docker files.

`Dockerfile-gcc`

Builds on Centos 7 latest and installs gcc 6.2.

Build with `docker build -f Dockerfile-gcc -t spdz/gcc:6.2 .`

`Dockerfile-spdz-libs`

Installs library dependencies for SPDZ

Build with `docker build -f Dockerfile-spdz-libs -t spdz/libs:latest .`

`Dockerfile-spdz`

Copies the source files into a container and builds SPDZ, no MPC compilation.

Ensure that the correct version of spdz is available in the spdz subdirectory.

Build with `docker build -f Dockerfile-spdz -t spdz/spdz .`

`Dockerfile-spdz-dev`

Convenience container to mount the SPDZ source files into a container to allow interactive dev and testing

Build with `docker build -f Dockerfile-spdz-dev -t spdz/spdzdev .`

Run with 

```
docker run -it --rm -p 14000-14010:14000-14010 -v <location of spdz on host directory>:/spdz spdz/spdzdev
```

`Dockerfile-spdz-preprocess`

