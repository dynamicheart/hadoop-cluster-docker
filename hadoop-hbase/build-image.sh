#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop-hbase image\n"
sudo docker build -t hadoop-hbase .

echo ""
