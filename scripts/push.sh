#!/bin/bash
#

set -o errexit

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -z "${DOCKER_REGISTRY}" ]; then
  export DOCKER_REGISTRY="registry.ng.bluemix.net"
  echo Setting DOCKER_REGISTRY to $DOCKER_REGISTRY
fi

if [ -z "${DOCKER_NAMESPACE}" ]; then
  echo You must export '$DOCKER_NAMESPACE' and it must work on the registry $DOCKER_REGISTRY
  exit 1
fi

docker tag middleware17/istioenv registry.ng.bluemix.net/$DOCKER_NAMESPACE/middleware17/istioenv
docker push registry.ng.bluemix.net/$DOCKER_NAMESPACE/middleware17/istioenv
