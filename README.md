
# Dev environment for Istio, with demos

To start,

```bash
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

# TODO Install Istio?

Should we install Istio?

# Prepare analytics servers

Expose the analytics servers outside of Docker

```
kubectl port-forward $(kubectl get pods --namespace istio-system --selector app=grafana --output jsonpath={.items[0].metadata.name}) --namespace istio-system 3000:3000 &
kubectl port-forward $(kubectl get pods --namespace istio-system --selector app=zipkin --output jsonpath={.items[0].metadata.name}) --namespace istio-system 9411:9411 &
```

# Install app

TODO Book Info

# Run this image itself in Kubernetes

```
bx plugin install container-registry -r Bluemix
# export DOCKER_NAMESPACE=`whoami`
bx cr namespace-list
docker tag middleware17/istioenv registry.ng.bluemix.net/$DOCKER_NAMESPACE/middleware17/istioenv
docker push registry.ng.bluemix.net/$DOCKER_NAMESPACE/middleware17/istioenv
kubectl run -it --rm --restart=Never dummy --image registry.ng.bluemix.net/$DOCKER_NAMESPACE/middleware17/istioenv
# or
# kubectl run -it --rm --restart=Never dummy --image-pull-policy=Always --image registry.ng.bluemix.net/$DOCKER_NAMESPACE/middleware17/istioenv
```