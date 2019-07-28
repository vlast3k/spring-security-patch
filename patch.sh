curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/spring-security-web-4.2.9.RELEASE.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/spring-security-web-4.2.9.RELEASE.jar
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/cloudfoundry-identity-server-4.24.0.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-server-4.24.0.jar
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/context.xml -o /var/vcap/data/uaa/tomcat/conf/context.xml
curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/server.xml -o /var/vcap/data/uaa/tomcat/conf/server.xml
monit restart uaa 
