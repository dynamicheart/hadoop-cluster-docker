echo -e "\n"

echo 0 > ~/zookeeper/myid
$ZK_HOME/bin/zkServer.sh start

echo -e "\n"

$HBASE_HOME/bin/start-hbase.sh

echo -e "\n"
