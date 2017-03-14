# spdz-deployment
Store artifacts to manage deployment of SPDZ engines. Deploy scripts, Docker files, instructions.

Separated out from spdz repo to avoid polluting with non core files.

## Setup

The SPDZ repo is included as a sub directory which is manually managed.

So to pull down for the first time run:

 

## Docker support
SPDZ engines are deployed in Docker containers using the following Docker files.

`Dockerfile-gcc`

Builds on Centos 7 latest and installs gcc 6.2.

Build with `docker build -f Dockerfile-gcc -t spdz/gcc:6.2 .`

* `Dockerfile-spdz-libs` installs library dependencies for SPDZ
* `../Dockerfile` copies the source files into a container and builds SPDZ, intended to be extended for specific SPDZ programs
* `../Dockerfile-dev` mounts the source files into a container to allow interactive dev and testing 

See docker files for instructions to build.

To run Dockerfile-dev:

    docker run -it --rm -p 14000-14010:14000-14010 -v <location of spdz on host directory>:/spdz spdz/spdzdev

