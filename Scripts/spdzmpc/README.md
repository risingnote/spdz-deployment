## Deployment scripts on spdz-mpc-p0/1/2
The following scripts are used to run dockerised services on each SPDZ party VM. These are exposed at:
- [https://alice.mpc.cs.bris.ac.uk](https://alice.mpc.cs.bris.ac.uk)
- [https://bob.mpc.cs.bris.ac.uk](https://bob.mpc.cs.bris.ac.uk)
- [https://carol.mpc.cs.bris.ac.uk](https://carol.mpc.cs.bris.ac.uk)

### Prerequisites
VM setup, for instructions see top level [README](https://github.com/bristolcrypto/spdz-deployment/blob/master/README.md).

The ```/opt/spdz/``` directory location to hold config, logs and other container input/output. See individual services for details of requirements.

The nginx, proxy and spdz containers communicate over a user defined network, setup as:

    docker network create --driver bridge spdz_nw

    docker network ls
    docker network inspect spdz_nw

### Scripts

These are used unchanged on each of the 3 hosts, except where noted.

```runNginx.sh``` The local host web proxy running in a docker container, forwarding SSL requests to the appropriate container.

```runBankersBonusProxy.sh``` Start a SPDZ proxy container. Uses the user defined network, no ports exposed to host.

```runBankersBonus.sh``` Start a SPDZ engine container. Uses the user defined network for client interactions. SPDZ to SPDZ communcations are via the exposed host ports. Amend the ports and player id for each host.

```runWorkshopVotingProxy.sh``` Start a SPDZ proxy container. Uses the user defined network, no ports exposed to host.

```runWorkshopVoting.sh``` Start a SPDZ engine container. User the user defined network for client interactions. SPDZ to SPDZ communcations are via the exposed host ports (which cannot clash with bankers-bonus.

### Execution order of scripts

ruNginx.sh must be run last as nginx checks that forward hosts are online or it will fail.

The SPDZ engine containers need the remote spdz-startup container (see [webmpc readme](../webmpc/README.md)) to be running to initialise successfully.   
