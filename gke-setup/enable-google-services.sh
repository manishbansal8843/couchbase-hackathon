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
echo "Creating gke cluster"
gcloud container clusters create $CLOUDSDK_CONTAINER_CLUSTER