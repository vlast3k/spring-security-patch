Patch which fixes _only_ redirectUrl handling

`
kubectl --namespace uaa patch sts uaa -p '{"spec":{"template":{"spec":{"containers":[{"name":"uaa","lifecycle":{"postStart":{"exec":{"command":["bash", "-c", "sleep 10; curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/patch.sh | bash"]}}}}]}}}}'
`

Patch which fixes redirectUrl _and_ removes token validation (and results in failure to refresh tokens)

`
kubectl --namespace uaa patch sts uaa -p '{"spec":{"template":{"spec":{"containers":[{"name":"uaa","lifecycle":{"postStart":{"exec":{"command":["bash", "-c", "sleep 10; curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/patch-notokenval.sh | bash"]}}}}]}}}}'
`

patch 3.2.2

`
kubectl --namespace uaa patch sts uaa -p '{"spec":{"template":{"spec":{"containers":[{"name":"uaa","lifecycle":{"postStart":{"exec":{"command":["bash", "-c", "sleep 10; curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/patch-3.2.2.sh | bash"]}}}}]}}}}'
`

patch 3.2.2 - NO TOKEN Validation (first 24h after applying asymmetric keys)

`
kubectl --namespace uaa patch sts uaa -p '{"spec":{"template":{"spec":{"containers":[{"name":"uaa","lifecycle":{"postStart":{"exec":{"command":["bash", "-c", "sleep 10; curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/patch-3.2.2-notokenval.sh | bash"]}}}}]}}}}'
`

Remove patches:

`
kubectl --namespace uaa patch sts uaa --type='json' -p='[{"op": "remove", "path": "/spec/template/spec/containers/0/lifecycle/postStart"}]'
`


Test commands

`
kubectl exec uaa-0 -c uaa -n uaa -- bash -c "curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/spring-security-web-4.2.9.RELEASE.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/spring-security-web-4.2.9.RELEASE.jar && /var/vcap/bosh/bin/monit restart uaa "
`

`
kubectl exec uaa-0 -c uaa -n uaa -- bash -c "curl https://raw.githubusercontent.com/vlast3k/spring-security-patch/master/cloudfoundry-identity-server-4.24.0.jar -o /var/vcap/data/uaa/tomcat/webapps/ROOT/WEB-INF/lib/cloudfoundry-identity-server-4.24.0.jar && /var/vcap/bosh/bin/monit restart uaa "
`
