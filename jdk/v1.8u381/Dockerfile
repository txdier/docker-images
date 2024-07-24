FROM alpine:latest
# RUN apk --update add curl ca-certificates tar
COPY glibc-2.35-r1.apk /usr/
RUN	apk upgrade --update && \
	apk add --update libstdc++ ca-certificates bash wget curl tar&& \
	apk add --allow-untrusted /usr/glibc-2.35-r1.apk && \
	rm -v /usr/*.apk
RUN wget https://pub-2f882d5e724749a382228f2e5512db91.r2.dev/jdk-8u381-linux-x64.tar.gz && \
	tar -zxvf jdk-8u381-linux-x64.tar.gz -C /usr/local/ && \
	rm -v jdk-8u381-linux-x64.tar.gz
ENV TZ=Asia/Shanghai
ENV JAVA_HOME /usr/local/jdk1.8.0_381
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
CMD ["java","-version"]