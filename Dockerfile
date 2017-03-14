FROM spdz/libs

# Pull SPDZ code into docker and build. Use as base to run specific mpc programs.
# Build container with:
#   docker build -f Dockerfile -t spdz/spdz .
# Run container with:

LABEL name="SPDZ MPC software" \
      description="Build SPDZ, as user spdzuser. A base for deploying SPDZ parties." \
      maintainer="Jonathan Evans <jon.evans@bristol.ac.uk>" \
      license="University of Bristol : Open Access Software Licence" 

RUN useradd -ms /bin/bash spdzuser
WORKDIR /home/spdzuser/spdz
COPY . /home/spdzuser/spdz

RUN chown -R spdzuser:spdzuser /home/spdzuser

USER spdzuser

RUN make clean \
  && make -j"$(nproc)" 

