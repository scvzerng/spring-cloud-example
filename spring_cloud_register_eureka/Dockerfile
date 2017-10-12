FROM openjdk:8-jdk-alpine
FROM jplock/zookeeper:3.4.8
VOLUME /tmp
ADD target/spring-cloud-register-eureka-*-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT exec 'java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar'