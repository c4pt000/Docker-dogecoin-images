random-string > random.txt
sed -e 's/^/rpcpassword=/' random.txt > new_random.txt
sed -n 1p new_random.txt > rpcpassword.txt
rm new_random.txt
rm random.txt
cat rpcpassword.txt > /root/.dogecoin/dogecoin.conf 
rm rpcpassword.txt
echo '
rpcuser=rpcuser
prune=2200
mempoolexpiry=24
dbcache=1000
daemon=1
port=22556
rpcport=22555



addnode=95.85.29.144
addnode=162.243.113.110
addnode=146.185.181.114
addnode=188.165.19.28
addnode=166.78.155.36
addnode=doge.netcodepool.org
addnode=doge.cryptoculture.net
addnode=dogepool.pw
addnode=78.46.57.132
' >> /root/.dogecoin/dogecoin.conf
sleep 5
dogecoind -daemon
