#!/bin/sh -l

aws eks update-kubeconfig --name $CLUSTER --alias default

exec helm "$@"
