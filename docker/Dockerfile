# Licensed Materials - Property of IBM
# (C) Copyright IBM Corp. 2017. All Rights Reserved.
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.

# Linux with CLI for installing and managing Istio, with ports
# for sharing the Kubernetes web UI.

FROM ubuntu:16.04

RUN apt-get update

# Recent Ubuntu doesn't have 'sudo'.  It isn't needed, but is expected.
#RUN apt-get install -y sudo

# Kubernetes
EXPOSE 8001

# Grafana
EXPOSE 3000

# Zipkin
EXPOSE 9411

# Prometheus
EXPOSE 9090

# ServiceGraph
EXPOSE 8088

# Things we like in a dev environment
RUN apt-get install -y curl vim git

# Install Bluemix _bx_ CLI (replaces _cf_)
# RUN curl --location --remote-name https://clis.ng.bluemix.net/download/bluemix-cli/latest/linux64
# Download, install, and remove in one step to avoid fat layer.
RUN curl --location --output /tmp/Bluemix_CLI_0.6.2_amd64.tar.gz https://clis.ng.bluemix.net/download/bluemix-cli/0.6.2/linux64 && \
   cd /tmp && \
   tar -xvf /tmp/Bluemix_CLI_0.6.2_amd64.tar.gz && \
   /tmp/Bluemix_CLI/install_bluemix_cli && \
   rm /tmp/Bluemix_CLI_0.6.2_amd64.tar.gz && \
   rm -rf /tmp/Bluemix_CLI

# Install _kubectl_ CLI
RUN curl --location --output /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.8.4/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl

RUN bx plugin install container-service -r Bluemix

# Download and install istioctl v3
RUN curl --location --output /tmp/istio-0.3.0-linux.tar.gz https://github.com/istio/istio/releases/download/0.3.0/istio-0.3.0-linux.tar.gz && \
   tar --directory=/tmp -xvf /tmp/istio-0.3.0-linux.tar.gz && \
   cp /tmp/istio-0.3.0/bin/istioctl /usr/local/bin/istioctl3

# Download and install istioctl but do not install Istio to cluster
RUN curl --location --output /tmp/istio-0.2.12-linux.tar.gz https://github.com/istio/istio/releases/download/0.2.12/istio-0.2.12-linux.tar.gz && \
   tar --directory=/tmp -xvf /tmp/istio-0.2.12-linux.tar.gz && \
   cp /tmp/istio-0.2.12/bin/istioctl /usr/local/bin

# See https://console.bluemix.net/docs/services/Registry/index.html#index
RUN bx plugin install container-registry -r Bluemix

# TODO login
# RUN bx login
