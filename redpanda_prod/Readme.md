## Dependencies
Linux packages needs to be installed ufw, pip, pipx and redpanda rpk.

## RUN
To benchmark system to get io config file use ```sudo bash tune.sh``` Then ```sudo bash setup.sh```

## Note
- Add more cpu and memeory as per hardware
- Increase the number of partitions and replicas for better performance
- Once run Get the tsl certificate from kubectl https://docs.redpanda.com/current/deploy/deployment-option/self-hosted/kubernetes/k-production-deployment/#tls-certificates
- Advertise ip-address or domain as per https://docs.redpanda.com/current/manage/kubernetes/networking/external/k-nodeport/
