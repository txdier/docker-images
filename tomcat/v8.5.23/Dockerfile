FROM ubuntu:22.04

COPY docker-entrypoint.sh /
RUN	apt update && \
	apt install -y wget curl tar unzip cron && \
	apt clean
# 官网下载旧版本需要登录。这里配置的jdk下载地址为Cloudflare R2地址。
RUN wget https://pub-2f882d5e724749a382228f2e5512db91.r2.dev/jdk-8u171-linux-x64.tar.gz && \
	tar -zxf jdk-8u171-linux-x64.tar.gz -C /usr/local/ && \
	wget https://pub-2f882d5e724749a382228f2e5512db91.r2.dev/tomcat.zip && \
	unzip tomcat.zip -d /app/ && \
	rm -v tomcat.zip jdk-8u171-linux-x64.tar.gz && \
	chmod -R +x /docker-entrypoint.sh

ENV TZ=Asia/Shanghai
ENV JAVA_HOME /usr/local/jdk1.8.0_171
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

ENTRYPOINT [ "/docker-entrypoint.sh" ]
