```
kubectl exec uaa-0 -c uaa -n uaa -- bash -c "curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/spring-security-web-4.2.9.RELEASE.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/spring-security-web-4.2.9.RELEASE.jar && /var/vcap/bosh/bin/monit restart uaa "
```

```
kubectl exec uaa-0 -c uaa -n uaa -- bash -c "curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/cloudfoundry-identity-server-4.24.0.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-server-4.24.0.jar && /var/vcap/bosh/bin/monit restart uaa "
```
