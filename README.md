
# Dev environment for Istio, with demos

To start,

```bash
./scripts/build.sh
docker run -it middleware17/istioenv:latest
```

The Kubernetes environment for the demo runs on IBM Cloud.  To access it, first log in to IBM Cloud

```
bx login -a https://api.ng.bluemix.net
# ... then use the supplied credentials
```

Access Kubernetes
```
# Point `KUBECONFIG` to personal Kubernetes cluster on IBM Cloud
eval $(bx cs cluster-config $(bx cs clusters | tail -n 1 | awk '{print $1}') | grep export)
kubectl get pods
```

Expose the Kubernetes web UI locally and outside of Docker

```
# By using 0.0.0.0 instead of the default 127.0.0.1 the UI is available beyond the container
kubectl proxy --address='0.0.0.0'
```

