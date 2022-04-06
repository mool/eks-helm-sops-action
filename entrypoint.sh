#!/bin/bash

set -x

aws eks update-kubeconfig --name $INPUT_EKSCLUSTER --alias default

helm $INPUT_ARGS
