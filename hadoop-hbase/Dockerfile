FROM hadoop

WORKDIR /root

# install hbase-1.3.1
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hbase/1.3.1/hbase-1.3.1-bin.tar.gz && \
    tar -xzvf hbase-1.3.1-bin.tar.gz && \
    mv hbase-1.3.1 /usr/local/hbase && \
    rm hbase-1.3.1-bin.tar.gz

# set environment variable
ENV HBASE_HOME=/usr/local/hbase
ENV PATH=$PATH:/usr/local/hbase/bin

RUN mkdir ~/zookeeper

COPY config/* /tmp/

RUN mv /tmp/hbase-site.xml $HBASE_HOME/conf/hbase-site.xml && \
    mv /tmp/hbase-env.sh $HBASE_HOME/conf/hbase-env.sh && \
    mv /tmp/regionservers $HBASE_HOME/conf/regionservers && \
    mv /tmp/start-hadoop-hbase.sh ~/start-hadoop-hbase.sh

RUN chmod +x $HBASE_HOME/bin/start-hbase.sh && \
    chmod +x ~/start-hadoop-hbase.sh
