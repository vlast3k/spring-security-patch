while [ ! -f /var/vcap/data/uaa/tomcat/conf/context.xml ]; do
  echo "Waiting context.xml to appear"
  sleep 2
done
while [ ! -f /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-server-4.24.0.jar ]; do
  echo "Waiting jars to appear"
  sleep 2
done
sleep 5
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/spring-security-web-4.2.9.RELEASE.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/spring-security-web-4.2.9.RELEASE.jar  
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/cloudfoundry-identity-server-4.24.0.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-server-4.24.0.jar
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/context.xml -o /var/vcap/data/uaa/tomcat/conf/context.xml  
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/server.xml -o /var/vcap/data/uaa/tomcat/conf/server.xml  
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/uaa -o /var/vcap/jobs/uaa/bin/uaa
chmod 777 /var/vcap/jobs/uaa/bin/uaa
/var/vcap/bosh/bin/monit restart uaa
