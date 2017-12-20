FROM ubuntu:14.04

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install -y openssh-server wget
RUN apt-get install -y openjdk-8-jdk

# install hbase-1.3.1
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hbase/1.3.1/hbase-1.3.1-bin.tar.gz && \
    tar -xzvf hbase-1.3.1-bin.tar.gz && \
    mv hbase-1.3.1 /usr/local/hbase && \
    rm hbase-1.3.1-bin.tar.gz


# install zookeeper-3.4.10
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/stable/zookeeper-3.4.10.tar.gz && \
    tar -xzvf zookeeper-3.4.10.tar.gz && \
    mv zookeeper-3.4.10 /usr/local/zookeeper && \
    rm zookeeper-3.4.10.tar.gz

# set environment variable
ENV HBASE_HOME=/usr/local/hbase
ENV ZK_HOME=/usr/local/zookeeper
ENV PATH=$PATH:/usr/local/hbase/bin:/usr/local/zookeeper/bin

RUN mkdir -p ~/zookeeper/data && \
    mkdir -p ~/zookeeper/logs

COPY config/* /tmp/

RUN mv /tmp/hbase-site.xml $HBASE_HOME/conf/hbase-site.xml && \
    mv /tmp/hbase-env.sh $HBASE_HOME/conf/hbase-env.sh && \
    mv /tmp/backup-masters $HBASE_HOME/conf/backup-masters && \
    mv /tmp/regionservers $HBASE_HOME/conf/regionservers && \
    mv /tmp/zoo.cfg $ZK_HOME/conf/zoo.cfg && \
    mv /tmp/start-zookeeper-hbase.sh ~/start-zookeeper-hbase.sh && \
    mv /tmp/start-zookeeper-region1.sh ~/start-zookeeper-region1.sh && \
    mv /tmp/start-zookeeper-region2.sh ~/start-zookeeper-region2.sh

RUN chmod +x $HBASE_HOME/bin/start-hbase.sh && \
    chmod +x $ZK_HOME/bin/zkServer.sh && \
    chmod +x ~/sstart-zookeeper-hbase.sh && \
    chmod +x ~/start-zookeeper-region1.sh && \
    chmod +x ~/start-zookeeper-region2.sh
