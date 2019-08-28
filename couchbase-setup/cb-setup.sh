#!/bin/bash
echo "Setting up couchbase operator"
echo "==============================="
kubectl create -f admission.yaml
kubectl create -f crd.yaml
kubectl create -f operator-role.yaml
kubectl create -f operator-service-account.yaml
kubectl create -f operator-role-binding.yaml
kubectl create -f operator-deployment.yaml
kubectl create -f secret.yaml
echo "Setting up couchbase cluster"
echo "==============================="
kubectl create -f couchbase-cluster.yaml
kubectl create -f couchbase-cli-create-user.yaml