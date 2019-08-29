# couchbase-hackathon

This repository contains all the build files to spawn a GKE cluster, install couchbase operator and then couchbase cluster on GKE.

Before doing that, one should create a google cloud project. Below are the steps.

Steps:

1. Create a gcp project "couchbase-hackathon".
2. Enable billing.
3. Enable GKE (container.googleapis.com), Cloud Resource Manager API ( cloudresourcemanager.googleapis.com), cloud-build on the project.
4. Add "kubernetes engine cluster admin", "kubernetes engine developer" and "service account user" role to the cloudbuild@gserviceaccount.com user.

# Spawning GKE cluster

1. Open gcloud shell.

2. Set project id and compute/zone in the cloud shell.

```
gcloud config set project couchbase-hackathon
gcloud config set compute/zone us-east1-b
```

3. Clone this repo.

`git clone https://github.com/manishbansal8843/couchbase-hackathon.git`

4. Swith directory

`cd couchbase-hackathon/gke-setup`

5. Trigger build

`gcloud builds submit .`

This will create a 3 node GKE cluster.

# Installing Couchbase operator and cluster

1. Switch directory

`cd ~/couchbase-hackathon/couchbase-setup`

2. Trigger build

`gcloud builds submit --config cloudbuild-create.yaml .`

# Updating Couchbase cluster

1. Switch directory

`cd ~/couchbase-hackathon/couchbase-setup`

2. Trigger build

`gcloud builds submit --config cloudbuild-update.yaml .`

# GKE clean-up

1. Switch directory

`cd couchbase-hackathon/gke-setup`

2. Trigger build

`gcloud builds submit --config cloudbuild-clean-up.yaml .`


