#!/bin/bash
echo "Setting up GKE"
echo "==============================="
echo "Enabling GKE apis"
gcloud services enable container.googleapis.com
gcloud config get-value project
gcloud config get-value compute/zone
gcloud config set compute/zone $CLOUDSDK_COMPUTE_ZONE
project=$(gcloud projects list --format="value(projectId)")
echo "Available google services for the project $project"
gcloud services list
echo "===================================="
echo "Checking if gke cluster existed"
echo "===================================="
does_cluster_exists=false
for clusters in  $(gcloud container clusters list --format="value(name)")
do
  echo "clusters:  $clusters"  
  if [ $clusters == $CLOUDSDK_CONTAINER_CLUSTER ]
    does_cluster_exists=true
    echo "$CLOUDSDK_CONTAINER_CLUSTER already exists. hence, will not try creating it again."
  fi
done
if [ $does_cluster_exists == false]
echo "===================================="
echo "Creating gke cluster"
echo "===================================="
gcloud container clusters create $CLOUDSDK_CONTAINER_CLUSTER
fi