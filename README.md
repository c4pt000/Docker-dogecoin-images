

# images wont grow they auto reduce to trim current block count recommended 25GB VPS or local root system ~ 25GB or greater
fedora 33

* c4pt/dogecoind-current-flat           latest    8c4f8b14483d   2 hours ago         4.23GB
* c4pt/electrum-doge                    latest    744a6332cd8b   3 weeks ago         1.45GB
* c4pt/dogecoinqt-current               latest    c69d3d230109   About an hour ago   5.73GB

* synced around block 3628937 03-02-2021




VPS host X11 requirements via SSH -X user@host              xhost requirements needed on both client side and remote side
xhost and X11 forwarding with your own caution considering the dangers of MIT-COOKIE_MAGIC hijacking and remote dangers
```
yum install -y xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps

```

sshd_config X11 forwarding
```
X11Forwarding yes
X11DisplayOffset 10
```


# Docker-dogecoin-images
for standard dogecoind " at block location "blocks": 3629011," 03-02-2021
```
requires --privileged and /sbin/init for crond functionality ports 22555 and 22556 are for rpcport and port X11 forwarding for drawing graphical application if needed
 examine generate-random-rpc-password.sh  located in /opt/dogecoin/
 https://raw.githubusercontent.com/c4pt000/Docker-dogecoin-images/main/generate-random-rpcpassword.sh
 
 ```
 
<br>
# "without doing a docker commit the wallet.dat and dogecoin.conf will completely regenerate"
# "suggested to run a docker commit and retag or rename the pull image

# Dogecoind

```
 docker run -it -d --privileged  --network=host -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
 c4pt/dogecoind-current-flat /sbin/init
 docker commit  <docker-image-digest;eg;3522de7bdaf57ba31>
 docker tag  <newly-returned-docker-digest> dogecoind-wallet
  docker run -it -d --privileged  -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
  dogecoind-wallet /sbin/init
docker exec -it dogecoind-wallet bash
```
# "without doing a docker commit the wallet.dat and dogecoin.conf will completely regenerate"
# "suggested to run a docker commit and retag or rename the pull image


# dogecoin-electrum 
* cd opt/electrum-doge/
* ./electrum-doge
```
docker run -it -d --network=host --privileged -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority c4pt/electrum-doge 

docker commit  <docker-image-digest;eg;3522de7bdaf57ba31>
docker stop <docker-image-digest;eg;3522de7bdaf57ba31>
 docker tag  <newly-returned-docker-digest> dogecoin-wallet-electrum
 docker run -it -d --network=host --privileged -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority dogecoin-wallet-electrum 
docker exec -it dogecoin-wallet-electrum bash
```


# DogecoinQT 
* cd /opt/dogecoin
* ./generate-random-rpc-password.sh 
```
docker run -it -d --network=host --privileged -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority c4pt/dogecoinqt-current /sbin/init
docker commit  <docker-image-digest;eg;3522de7bdaf57ba31>
docker stop <docker-image-digest;eg;3522de7bdaf57ba31>
 docker tag  <newly-returned-docker-digest> dogecoinqt-wallet-current
  docker run -it -d --network=host --privileged -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority dogecoinqt-wallet-current /sbin/init
docker exec -it dogecoinqt-wallet-current bash
```

# AS AN EXAMPLE dogecoind or dogecoinQT
```
docker run -it -d --network=host --privileged -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority c4pt/dogecoind-current-flat /sbin/init


c430b3d668b5aefbbf0af006d5b2ae88be886bfb280fd17196d82b9404993cbc
┌─[root@localhost]─[~]
└──╼ #docker commit c430b3d668b5aefbbf0af006d5b2ae88be886bfb280fd17196d82b9404993cbc       # to preserve wallet.dat and dogecoin.conf in /root/.dogecoin                                                                                        
sha256:5804486902246f0702a78b7632574909a28902d9eebf700bd21be5b0b3e31de9                    # newly formed image with changes

┌─[root@localhost]─[~]
└──╼ #docker stop c430b3d668b5aefbbf0af006d5b2ae88be886bfb280fd17196d82b9404993cbc         # stop running image to avoid port conflict                                                                                        
┌─[root@localhost]─[~]
└──╼ #docker tag 5804486902246f0702a78b7632574909a28902d9eebf700bd21be5b0b3e31de9 dogecoind-wallet-current     # rename formed image with changes

┌─[root@localhost]─[~]
└──╼ #docker run -it -d --network=host --privileged -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority dogecoind-wallet-current /sbin/init

30f60f4d03b7f2a4eaf9e4dafdcb3cfa49f2d3927f3d43f02572c6e0fc916fa9

┌─[root@localhost]─[~]
└──╼ #docker exec -it 30f60f4d03b7f2a4eaf9e4dafdcb3cfa49f2d3927f3d43f02572c6e0fc916fa9 bash           

```


