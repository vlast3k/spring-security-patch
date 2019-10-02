while [ ! -f /var/vcap/jobs/uaa/config/uaa.yml ]; do	
  echo "Waiting uaa.yml to appear"	
  sleep 2	
done	

while [ ! ls /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-model* 1> /dev/null 2>&1 ]; do
  echo "Waiting jars to appear"	
  sleep 2	
done


echo "Sleeping 5 seconds"
sleep 5	

if [ -f /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-model-74.0.0.0.2.jar	]; then
  echo "Patching version"
  curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/cloudfoundry-identity-model-74.0.0.0.2.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-model-74.0.0.0.2.jar	
fi

if ! grep "sap.ids"  /var/vcap/jobs/uaa/config/uaa.yml ; then
  echo "Patching UAA"
  sed -i -e $'s/idpDiscoveryEnabled: false/idpDiscoveryEnabled: false\\\n  defaultIdentityProvider: sap.ids/g' /var/vcap/jobs/uaa/config/uaa.yml 
fi

/var/vcap/bosh/bin/monit restart uaa
