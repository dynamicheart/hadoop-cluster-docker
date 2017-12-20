#!/bin/bash

# the default node number is 3
N=${1:-2}

# start hadoop master container
sudo docker rm -f hbase-master &> /dev/null
echo "start hbase-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 16010:16010 \
                --name hbase-master \
                --hostname hbase-master \
                hbase-zookeeper:latest &> /dev/null

# start hadoop slave container
i=1
while [ $i -le $N ]
do
	sudo docker rm -f hbase-region$i &> /dev/null
	echo "start hbase-region$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name hbase-region$i \
	                --hostname hbase-region$i \
	                hbase-zookeeper:latest &> /dev/null
	i=$(( $i + 1 ))
done

# get into hadoop master container
sudo docker exec -it hbase-master bash
