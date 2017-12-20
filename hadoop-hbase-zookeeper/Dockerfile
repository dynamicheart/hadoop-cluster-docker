FROM hadoop-hbase

WORKDIR /root

# install zookeeper-3.4.10
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/stable/zookeeper-3.4.10.tar.gz && \
    tar -xzvf zookeeper-3.4.10.tar.gz && \
    mv zookeeper-3.4.10 /usr/local/zookeeper && \
    rm zookeeper-3.4.10.tar.gz

# set environment variable
ENV ZK_HOME=/usr/local/zookeeper
ENV PATH=$PATH:/usr/local/zookeeper/bin

COPY config/* /tmp/

RUN mv /tmp/hbase-site.xml $HBASE_HOME/conf/hbase-site.xml && \
    mv /tmp/hbase-env.sh $HBASE_HOME/conf/hbase-env.sh && \
    mv /tmp/regionservers $HBASE_HOME/conf/regionservers && \
    mv /tmp/zoo.cfg $ZK_HOME/conf/zoo.cfg && \
    mv /tmp/start-hadoop-hbase-zookeeper.sh ~/start-hadoop-hbase-zookeeper.sh

RUN chmod +x $ZK_HOME/bin/zkServer.sh && \
    chmod +x ~/start-hadoop-hbase-zookeeper.sh
