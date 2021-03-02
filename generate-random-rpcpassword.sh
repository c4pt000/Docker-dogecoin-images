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
server=1
port=22556
rpcport=22555
' >> /root/.dogecoin/dogecoin.conf
sleep 5
dogecoind -daemon
