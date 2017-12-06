#!/bin/bash
#

set -o errexit

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

pushd $SCRIPTDIR/../docker
  docker build -t middleware17/istioenv .
popd

