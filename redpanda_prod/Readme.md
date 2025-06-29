## Dependencies
Linux packages needs to be installed ufw, pip, pipx and redpanda rpk.

## RUN
To benchmark system to get io config file use ```sudo bash tune.sh``` Then ```sudo bash setup.sh```

## Access
- Use ```kubectl port-forward -n redpanda svc/redpanda-console --address 0.0.0.0 8080:8080``` to access the console.
- NodePort service exposes the require services check in more details here<br>
https://docs.redpanda.com/current/deploy/deployment-option/self-hosted/kubernetes/k-production-deployment/#perform-a-self-test

## Note
- Add more cpu and memeory as per hardware
- Increase the number of partitions and replicas for better performance
- Once run Get the TSL certificate from kubectl<br>  https://docs.redpanda.com/current/deploy/deployment-option/self-hosted/kubernetes/k-production-deployment/#tls-certificates
- Advertise ip-address or domain to resolve dns issue from client<br>  https://docs.redpanda.com/current/manage/kubernetes/networking/external/k-nodeport/
