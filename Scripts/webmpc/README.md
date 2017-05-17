## Deployment scripts on web-mpc-p0
The following scripts are used to stop and start dockerised services from web-mpc-p0, which is exposed at [https://mpc.cs.bris.ac.uk](https://mpc.cs.bris.ac.uk).

### Prerequisites
VM setup, for instructions see top level [README](https://github.com/bristolcrypto/spdz-deployment/blob/master/README.md).

The ```/opt/spdz/``` directory location to hold config, logs and other container input/output. See individual services for details of requirements.

The nginx and gui containers communicate over a user defined network, setup as:

    docker network create --driver bridge spdz_nw

    docker network ls
    docker network inspect spdz_nw


The stop and start scripts ssh into the spdzmpc VMs to run [scripts](../spdzmpc/README.md) which need to be installed. 

### bankersBonus

```startBankersBonusAll.sh``` To start remote services on the 3 SPDZ parties along with the local docker containers.

```stopBankersBonusAll.sh``` To stop the remote and local docker services.

```runSpdzStartup.sh``` A local docker container to coordinate SPDZ engine startup, listens on host port (no iptables changes needed because docker adds forward rules).

```runBankersBonusGui.sh``` The node server for the bankers bonus GUI and REST endpoints.

### workshopVoting

```startWorkshopVotingAll.sh``` To start remote services on the 3 SPDZ parties along with the local docker containers.

```stopWorkshopVotingAll.sh``` To stop the remote and local docker services.

```runSpdzStartup.sh``` A local docker container to coordinate SPDZ engine startup, listens on host port. listens on host port (no iptables changes needed because docker adds forward rules).

```runBankersBonusGui.sh``` The node server for the bankers bonus GUI and REST endpoints.

### nginx

nginx is used as a reverse web proxy to allow multiple SPDZ demonstartors to run on the same VMs, using path name to split traffic to different services.

```startNginxAll.sh``` To start remote nginx proxies on the 3 SPDZ parties along with the local nginx proxy docker container.

```stopNginxAll.sh``` To stop the remote and local docker services.

```runNginx.sh``` The local host web proxy running in a docker container, forwarding SSL requests to the appropriate container.

### Execution order of scripts

At startup:

 - bankersBonus/startBankersBonusAll.sh - self contained, will startup with out other services, not available until nginx proxies running. 
 - workshopVoting/startWorkshopVotingAll.sh - initialisation is dependant on accessing SPDZ engines, so needs nginx proxies. Initialisation of Workshop Voting GUI will retry for a minute and then fail.
 - nginx/startNginxAll.sh - must run last as checks that forward hosts are online or will fail.  

At shutdown, suggest following order:

- nginx/stopNginxAll.sh
- workshopVoting/stopWorkshopVotingAll.sh
- bankersBonus/stopBankersBonusAll.sh