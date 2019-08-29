#!/bin/bash
echo "Cleaning up GKE"
echo "==============================="
gcloud config set compute/zone $CLOUDSDK_COMPUTE_ZONE
echo "===================================="
echo "Checking if gke cluster existed"
echo "===================================="
for clusters in  $(gcloud container clusters list --format="value(name)")
do
  echo "Starting deletion of cluster:  $clusters"   
  gcloud container clusters delete $clusters --async --quiet
  echo "$clusters deleted successfully."
done
echo "GKE clean-up completed successfully."