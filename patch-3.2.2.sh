while [ ! -f /var/vcap/data/uaa/tomcat/conf/context.xml ]; do	
  echo "Waiting context.xml to appear"	
  sleep 2	
done	
while [ ! -f /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-model-74.0.0.0.2.jar ]; do	
  echo "Waiting jars to appear"	
  sleep 2	
done	
sleep 5	
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/cloudfoundry-identity-model-74.0.0.0.2.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-model-74.0.0.0.2.jar	
/var/vcap/bosh/bin/monit restart uaa
