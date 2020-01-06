while [ ! -f /var/vcap/jobs/uaa/config/uaa.yml ]; do	
  echo "Waiting uaa.yml to appear"	
  sleep 2	
done	

echo "Sleeping 5 seconds"
sleep 5	

if ! grep "sap.ids"  /var/vcap/jobs/uaa/config/uaa.yml ; then
  echo "Patching UAA"
  sed -i -e $'s/idpDiscoveryEnabled: false/idpDiscoveryEnabled: false\\\n  defaultIdentityProvider: sap.ids/g' /var/vcap/jobs/uaa/config/uaa.yml 
fi

/var/vcap/bosh/bin/monit restart uaa
