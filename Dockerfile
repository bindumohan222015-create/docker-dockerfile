FROM ubuntu:22.04

LABEL maintainer="bindu"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /testData

RUN apt update && \
    apt install -y openjdk-17-jdk wget tar && \
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.112/bin/apache-tomcat-9.0.112.tar.gz && \
    tar -xzf apache-tomcat-9.0.112.tar.gz && \
    rm apache-tomcat-9.0.112.tar.gz

# Copy WAR from build context
COPY Amazon.war /testData/apache-tomcat-9.0.112/webapps/

EXPOSE 8080

CMD ["/testData/apache-tomcat-9.0.112/bin/catalina.sh", "run"]

