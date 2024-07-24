FROM ubuntu:22.04

RUN apt update && \
    apt install -y wget curl tar && \
    apt clean
RUN wget https://pub-2f882d5e724749a382228f2e5512db91.r2.dev/jdk-8u381-linux-x64.tar.gz && \
    tar -zxf jdk-8u381-linux-x64.tar.gz -C /usr/local/ && \
    rm -v jdk-8u381-linux-x64.tar.gz && echo "Asia/Shanghai" > /etc/timezone
ENV TZ=Asia/Shanghai
ENV JAVA_HOME /usr/local/jdk1.8.0_381
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
CMD ["java","-version"]
