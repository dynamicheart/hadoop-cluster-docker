echo -e "\n"

echo 2 > ~/zookeeper/myid
$ZK_HOME/bin/zkServer.sh start

echo -e "\n"

$HBASE_HOME/bin/start-hbase.sh

echo -e "\n"
