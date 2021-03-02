# Docker-dogecoin-images
for standard dogecoind " at block location "blocks": 3629011," 03-02-2021

requires --privileged and /sbin/init for crond functionality ports 22555 and 22556 are for rpcport and port X11 forwarding for drawing graphical application if needed
 examine generate-random-rpc-password.sh  located in /opt/dogecoin/
 https://raw.githubusercontent.com/c4pt000/Docker-dogecoin-images/main/generate-random-rpcpassword.sh
 
 ```
 
```
"without doing a docker commit the wallet.dat and dogecoin.conf will completely regenerate"
"suggested to run a docker commit and retag or rename the pull image
 docker run -it -d --privileged  -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix c4pt/dogecoind-current-flat sbin/init
 docker commit  <docker-image-digest;eg;3522de7bdaf57ba31>
 docker tag  <newly-returned-docker-digest> dogecoind-wallet
  docker run -it -d --privileged  -p 22555:22556 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix c4pt/dogecoind-wallet sbin/init
docker exec -it dogecoind-wallet bash
```
