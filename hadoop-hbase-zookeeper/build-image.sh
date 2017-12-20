#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop-hbase-zookeeper image\n"
sudo docker build -t hadoop-hbase-zookeeper .

echo ""
