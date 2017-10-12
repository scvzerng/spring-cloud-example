FROM centos
RUN mkdir -p /context /app /download /tmp/zookeeper
VOLUME /tmp
RUN yum install -y java-1.8.0-openjdk.x86_64
RUN yum install -y wget
RUN wget -P /download https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.3.6/zookeeper-3.3.6.tar.gz
RUN tar -zxvf /download/zookeeper-3.3.6.tar.gz -C /context
RUN cp /context/zookeeper-3.3.6/conf/zoo_sample.cfg /context/zookeeper-3.3.6/conf/zoo.cfg
RUN wget -P /download http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/0.11.0.1/kafka_2.11-0.11.0.1.tgz
RUN tar -zxvf /download/kafka_2.11-0.11.0.1.tgz -C /context
ADD target/*.jar /app/app.jar
EXPOSE 8762 2181 9092
ENV JAVA_OPTS=""
CMD /context/zookeeper-3.3.6/bin/zkServer.sh start && \
nohup /context/kafka_2.11-0.11.0.1/bin/kafka-server-start.sh /context/kafka_2.11-0.11.0.1/config/server.properties & >/dev/null 2>&1 &&\
 java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app/app.jar