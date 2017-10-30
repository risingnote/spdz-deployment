# UOB VM deploy instructions
Instructions to prepare the vanilla Centos 7 VMs to run the SPDZ demonstrators.

## Addresses

- mpc.cs.bris.ac.uk (137.222.0.176) -> web-mpc-p0.cs.bris.ac.uk (172.25.2.234)
- alice.mpc.cs.bris.ac.uk (137.222.0.177) -> spdz-mpc-p0.cs.bris.ac.uk (172.25.2.235)
- bob.mpc.cs.bris.ac.uk (137.222.0.178) -> spdz-mpc-p1.cs.bris.ac.uk (172.25.2.236)
- carol.mpc.cs.bris.ac.uk (137.222.0.179) -> spdz-mpc-p2.cs.bris.ac.uk (172.25.2.237)


## General setup on each Centos 7 VM
###	Docker 
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum makecache fast
    sudo yum install docker-ce
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo groupadd docker
    sudo usermod -aG docker $USER
    
to allow docker bash completion:

    sudo yum install bash-completion
    sudo cp /usr/share/bash-completion/completions/docker /etc/profile.d/ 

other:

    sudo yum install -y unzip vim-common

### Certs setup

    mkdir /opt/sdpz/cert with 700
    Concat intermediate cert with server cert.
    cat mpc_cs_bris_ac_uk.crt RootCertificates/QuoVadisEVIntermediateCertificate.crt > mpc_cs_bris_ac_uk_chain.crt
    copy .key and .crt to /opt/spdz/cert
    ln -s mpc.cs.bris.ac.uk.key server.key
    ln -s mpc_cs_bris_ac_uk_chain.crt server.crt
	
### Firewall

Note that installing Docker amends iptables as it inserts forward rules which allow incoming TCP connections (even without INPUT rules). However to ensure that the SPDZ demonstrators can run in or outside Docker, make the following changes on alice, bob and carol.

```sudo iptables -L INPUT --line-numbers``` - to query input rules to find best place to insert new rule. 

Insert the rule to allow SPDZ engines to communicat with each other (here inserting at position 10):

    iptables -I INPUT 10 -p tcp -s 172.25.2.0/24 --match multiport --dports 13000:13100 -j ACCEPT -m comment --comment "TCP for SPDZ communication"

Other useful commands:

```iptables -D INPUT 5``` to delete rule at position 5

```iptables -L INPUT -v``` to view rule packet counts, e.g. when trying to debug connections refused

```iptables -Z``` to reset packet counts
	
Backup iptables to keep changes through a reboot:
- copy ```/etc/sysconfig/iptables``` to backup filename
- ```iptables-save > /etc/sysconfig/iptables``` to save current memory settings to file

### Issues

1. The workshop voting GUI runs SSL connections from mpc -> alice, bob and carol at startup. There is a problem with running SSL connections using the external IP addresses from the internal network, producing an SSL handshake error. This is related to the load balancer used by external web access. The pragmatic solution adopted is to use the internal IP addresses and to override the wrong host in certificate
warning with the node environment variable  NODE_TLS_REJECT_UNAUTHORIZED=1.

2. yum-cron runs at 0400 approx and if a docker update is applied the running containers are killed and not automatically restarted. Solved with cron job to restart docker containers (see Scripts/webmpc/restart):

```30 05 * * * /home/je0018/docker/restart/restartAll.sh >> /home/je0018/docker/restart/restart.log 2>&1 ```



