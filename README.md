|Hostname     |Zookeeper| HDFS                        |HBASE                       |Spark |
|-------------|---------|-----------------------------|----------------------------|      |
|hadoop-master|         |NameNode<br>SecondaryNameNode|                            |      |
|hadoop-slave |         |DataNode                     |                            |      |
|hbase-master |YES      |                             |HMaster                     |      |
|hbase-region1|YES      |                             |RegionServer<br>BackupMaster|      |
|hbase-region2|YES      |                             |RegionServer<br>BackupMaster|      |
|spark-master |         |                             |                            |Master|
|spark-worker1|         |                             |                            |Worker|
|spark-worker2|         |                             |                            |Worker|
|spark-worker3|         |                             |                            |Worker|
|spark-worker4|         |                             |                            |Worker|
