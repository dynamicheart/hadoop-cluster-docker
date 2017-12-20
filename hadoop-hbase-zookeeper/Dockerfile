FROM hadoop

WORKDIR /root

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

COPY config/* /tmp/

RUN mv /tmp/hbase-site.xml $HBASE_HOME/conf/hbase-site.xml && \
    mv /tmp/hbase-env.sh $HBASE_HOME/conf/hbase-env.sh && \
    mv /tmp/regionservers $HBASE_HOME/conf/regionservers && \
    mv /tmp/start-hadoop-hbase.sh ~/start-hadoop-hbase.sh

RUN chmod +x $HBASE_HOME/bin/start-hbase.sh && \
    chmod +x ~/start-hadoop-hbase.sh
