FROM ubuntu:14.04

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y openssh-server wget && \
    apt-get install -y openjdk-8-jdk

RUN apt-get install -y apt-transport-https

# install sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get install -y sbt

# install spark-2.2.0
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz && \
    tar -xzvf spark-2.2.0-bin-hadoop2.7.tgz && \
    mv spark-2.2.0-bin-hadoop2.7 /usr/local/spark && \
    rm spark-2.2.0-bin-hadoop2.7.tgz

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV SPARK_HOME=/usr/local/spark
ENV PATH=$PATH:/usr/local/spark/bin:/usr/local/spark/sbin

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY config/* /tmp/

RUN mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/spark-env.sh $SPARK_HOME/conf/spark-en.sh && \
    mv /tmp/slaves $SPARK_HOME/conf/slaves

RUN chmod +x $SPARK_HOME/sbin/start-master.sh && \
    chmod +x $SPARK_HOME/sbin/start-slaves.sh

CMD [ "sh", "-c", "service ssh start; bash"]
