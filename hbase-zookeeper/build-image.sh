#!/bin/bash

echo ""

echo -e "\nbuild docker hbase-zookeeper image\n"
sudo docker build -t hbase-zookeeper .

echo ""
