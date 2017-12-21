#!/bin/bash

# the default node number is 3
N=${1:-4}

# start hadoop master container
sudo docker rm -f spark-master &> /dev/null
echo "start spark-master container..."
sudo docker run -itd \
                --net=hadoop \
                --name spark-master \
                --hostname spark-master \
                spark:latest &> /dev/null

# start hadoop worker container
i=1
while [ $i -le $N ]
do
	sudo docker rm -f spark-worker$i &> /dev/null
	echo "start spark-worker$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name spark-worker$i \
	                --hostname spark-worker$i \
	                spark:latest &> /dev/null
	i=$(( $i + 1 ))
done

# get into hadoop master container
sudo docker exec -it spark-master bash
