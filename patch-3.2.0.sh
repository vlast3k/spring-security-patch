while [ ! -f /var/vcap/data/uaa/tomcat/conf/context.xml ]; do	
  echo "Waiting context.xml to appear"	
  sleep 2	
done	
while [ ! -f /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-server-0.0.0.jar ]; do	
  echo "Waiting jars to appear"	
  sleep 2	
done	
sleep 5	
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/spring-security-web-5.1.5.RELEASE.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/spring-security-web-5.1.5.RELEASE.jar  	
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/cloudfoundry-identity-server-0.0.0-allowuaa.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-server-0.0.0.jar	
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/cloudfoundry-identity-model-0.0.0.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-model-0.0.0.jar	
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/context.xml -o /var/vcap/data/uaa/tomcat/conf/context.xml  	
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/server.xml -o /var/vcap/data/uaa/tomcat/conf/server.xml  	
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/uaa -o /var/vcap/jobs/uaa/bin/uaa	
curl https://raw.githubusercontent.com/vlast3k/tomcat/master/custom-tomcat-utils/target/custom-tomcat-utils-0.0.1-SNAPSHOT.jar -o /var/vcap/data/uaa/tomcat/lib/custom-tomcat-utils-0.0.1-SNAPSHOT.jar
chmod 777 /var/vcap/jobs/uaa/bin/uaa	
/var/vcap/bosh/bin/monit restart uaa
