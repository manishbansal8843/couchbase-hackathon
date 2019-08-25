#!/bin/bash
for project in  $(gcloud projects list --format="value(projectId)")
do
  echo "ProjectId:  $project"  
done