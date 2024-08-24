#! /bin/bash
set -e
sysctl -p
if [ -z "$JAVA_OPT" ]; then 
   sed -i -e 's/JAVA_OPTS\=\"ENVJAVAOPTS\"//' /app/tomcat/bin/catalina.sh
else
   sed -i -e "s/ENVJAVAOPTS/$JAVA_OPT/" /app/tomcat/bin/catalina.sh
fi
#hostip=`hostname`
#sed -i -e "s/HOSTNAMEIP/$hostip/" /app/tomcat/bin/catalina.sh
if [ -z "$domain" ]; then
   echo "not set domain..."
else
   echo $(ip addr show eth0 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1) $domain >> /etc/hosts
fi
/usr/sbin/crond
echo "Tomcat is running..."
#exec /app/tomcat/bin/catalina.sh run 2>&1 | /usr/sbin/cronolog /app/tomcat/logs/catalina.%Y-%m-%d.log
exec "$@"
