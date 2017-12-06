#!/bin/bash
#

set -o errexit

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Port 8001 is the Kubernetes UI if kubectl proxy is running
docker run -it -p 8001:8001 -p 8080:8080 middleware17/istioenv
