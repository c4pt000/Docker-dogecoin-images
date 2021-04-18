** WIP semi-functional recommended 8gb + 4 cpus


# for docker-dogecoind-full 50GB 
 
 * 04-16-2021 sync
 
 docker run -it -d -p 22555:22555 -p 22556:22556 c4pt/dogecoind-current-full
 
 docker exec -it <docker_vm_hash> bash
 

dogecoin.conf: /root/.dogecoin/dogecoin.conf -> c4pt/dogecoind-current-FULL
```
rpcpassword=yourpasswordhere
rpcuser=rpcuser
mempoolexpiry=24
dbcache=1000
server=1
port=22556
rpcport=22555
rpcallowip=127.0.0.1


addnode=95.85.29.144
addnode=162.243.113.110
addnode=146.185.181.114
addnode=188.165.19.28
addnode=166.78.155.36
addnode=doge.netcodepool.org
addnode=doge.cryptoculture.net
addnode=dogepool.pw
addnode=78.46.57.132


addnode=core0-gb.dogecoin.gg
addnode=core1-gb.dogecoin.gg
addnode=dnf-1.gbf.re
addnode=dnf-1.gbf.re
addnode=dnf-2.gbf.re
addnode=dnf-2.gbf.re
addnode=dnf-3.gbf.re
addnode=dnf-3.gbf.re
addnode=dnf-4.gbf.re
addnode=dnf-4.gbf.re
addnode=dnf-alpha.gbf.re
addnode=dnf-beta.gbf.re
addnode=dnf-test.gbf.re
addnode=doge1-eu.langerhans.de
addnode=doge1-eu.langerhans.de
addnode=doge2-eu.langerhans.de
addnode=doge2-eu.langerhans.de
addnode=doge3-eu.langerhans.de
addnode=doge3-eu.langerhans.de
addnode=doge4-eu.langerhans.de
addnode=doge4-eu.langerhans.de
addnode=dogenode.11z.me:22556
addnode=eu1.5trubel.de
addnode=eu2.5trubel.de
addnode=superfastdoge.ddns.net
addnode=us-1.wowsuchfast.com
addnode=us-2.wowsuchfast.com
```

# images wont grow they auto reduce to trim current block count recommended 25GB VPS or local root system ~ 25GB or greater
fedora 33

* c4pt/dogecoind-current-flat           latest    8c4f8b14483d   2 hours ago         4.23GB
* c4pt/electrum-doge                    latest    744a6332cd8b   3 weeks ago         1.45GB
* c4pt/dogecoinqt-current               latest    c69d3d230109   About an hour ago   5.73GB

* synced around block 3628937 03-02-2021




VPS host X11 requirements via SSH -X user@host              xhost requirements needed on both client side and remote side
xhost and X11 forwarding with your own caution considering the dangers of MIT-COOKIE_MAGIC hijacking and remote dangers

* update 03-04-2021 Avoid /sbin/init for PID1 with --privileged might cause selinux permission label errors leading up tp running /.autorelabel on the host where docker is running

```
yum install -y xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps xorg-x11-server-utils

```

sshd_config X11 forwarding
```
X11Forwarding yes
X11DisplayOffset 10
```


# Docker-dogecoin-images
for standard dogecoind " at block location "blocks": 3629011," 03-02-2021
```

 examine generate-random-rpc-password.sh  located in /opt/dogecoin/
 https://raw.githubusercontent.com/c4pt000/Docker-dogecoin-images/main/generate-random-rpcpassword.sh
 
 ```
 
<br>



# "without doing a docker commit the wallet.dat and dogecoin.conf will completely regenerate"

# "suggested to run a docker commit and retag or rename the pull image


<br>
<br>
<br>
<br>
* about a 20 minute delay to sync as of 03-02-2021
<br>
root@localhost:/opt/dogecoin# dogecoin-cli getinfo
<br>
error code: -28
<br>
error message:
<br>
Loading block index...
<br>
root@localhost:/opt/dogecoin# dogecoin-cli getinfo
<br>
error code: -28
<br>
error message:
<br>
Rewinding blocks...
<br>
<br>
<br>
<br>
<br>
root@localhost:/opt/dogecoin# dogecoin-cli getinfo
<br>
error: couldn't connect to server: unknown (code -1)
<br>
(make sure server is running and you are connecting to the correct RPC port)
<br>
root@localhost:/opt/dogecoin# dogecoind -daemon
<br>
Dogecoin server starting
<br>

docker run -it -d -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro c4pt/dogecoind-current-flat bash



# Dogecoind
* cd /opt/dogecoin
* ./generate-random-rpc-password.sh

```
 docker run -it -d  --network=host -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro c4pt/dogecoind-current-flat bash
 docker commit  <docker-image-digest;eg;3522de7bdaf57ba31>

```
# "without doing a docker commit the wallet.dat and dogecoin.conf will completely regenerate"
# "suggested to run a docker commit and retag or rename the pull image


# dogecoin-electrum 
* cd opt/electrum-doge/
* ./electrum-doge
```
docker run -it -d --network=host  -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority c4pt/electrum-doge bash

docker commit  <docker-image-digest;eg;3522de7bdaf57ba31>
docker stop <docker-image-digest;eg;3522de7bdaf57ba31>
 docker tag  <newly-returned-docker-digest> dogecoin-wallet-electrum
 docker run -it -d --network=host  -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority dogecoin-wallet-electrum bash
docker exec -it dogecoin-wallet-electrum bash
```


# DogecoinQT 
* cd /opt/dogecoin
* ./generate-random-rpc-password.sh 
```
docker run -it -d --network=host  -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority c4pt/dogecoinqt-current bash
docker commit  <docker-image-digest;eg;3522de7bdaf57ba31>
docker stop <docker-image-digest;eg;3522de7bdaf57ba31>
 docker tag  <newly-returned-docker-digest> dogecoinqt-wallet-current
  docker run -it -d --network=host -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority dogecoinqt-wallet-current bash
docker exec -it dogecoinqt-wallet-current bash
```

# AS AN EXAMPLE dogecoind or dogecoinQT
```
docker run -it -d --network=host  -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro c4pt/dogecoind-current-flat bash


c430b3d668b5aefbbf0af006d5b2ae88be886bfb280fd17196d82b9404993cbc
┌─[root@localhost]─[~]
└──╼ #docker commit c430b3d668b5aefbbf0af006d5b2ae88be886bfb280fd17196d82b9404993cbc       # to preserve wallet.dat and dogecoin.conf in /root/.dogecoin                                                                                        
sha256:5804486902246f0702a78b7632574909a28902d9eebf700bd21be5b0b3e31de9                    # newly formed image with changes

┌─[root@localhost]─[~]
└──╼ #docker stop c430b3d668b5aefbbf0af006d5b2ae88be886bfb280fd17196d82b9404993cbc         # stop running image to avoid port conflict                                                                                        
┌─[root@localhost]─[~]
└──╼ #docker tag 5804486902246f0702a78b7632574909a28902d9eebf700bd21be5b0b3e31de9 dogecoind-wallet-current     # rename formed image with changes

┌─[root@localhost]─[~]
└──╼ #docker run -it -d --network=host -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro dogecoind-wallet-current bash

30f60f4d03b7f2a4eaf9e4dafdcb3cfa49f2d3927f3d43f02572c6e0fc916fa9

┌─[root@localhost]─[~]
└──╼ #docker exec -it 30f60f4d03b7f2a4eaf9e4dafdcb3cfa49f2d3927f3d43f02572c6e0fc916fa9 bash           

```


