#!/bin/bash

# Set Variables
CLUSTER_NAME="demo-cluster"
ZONE="europe-west4-a"
PROJECT_ID=$(gcloud config get-value project)

# Set the default zone
gcloud config set compute/zone $ZONE

# Delete the GKE Cluster
echo "Deleting GKE Cluster..."

gcloud container clusters delete $CLUSTER_NAME --zone $ZONE --quiet --project $PROJECT_ID

echo "Cluster $CLUSTER_NAME deleted successfully."