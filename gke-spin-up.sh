#!/bin/bash

# Set Variables
CLUSTER_NAME="demo-cluster"
ZONE="europe-west4-a"
MACHINE_TYPE="e2-medium"
MIN_NODES=1
MAX_NODES=3
PROJECT_ID=$(gcloud config get-value project)

# Set the default zone
gcloud config set compute/zone $ZONE

# Create the GKE Standard cluster with preemptible nodes
echo "Creating GKE Standard Cluster with Preemptible Nodes..."

gcloud container clusters create $CLUSTER_NAME \
    --zone $ZONE \
    --machine-type $MACHINE_TYPE \
    --num-nodes $MIN_NODES \
    --enable-autoscaling --min-nodes $MIN_NODES --max-nodes $MAX_NODES \
    --preemptible \
    --release-channel stable \
    --project $PROJECT_ID

echo "Cluster $CLUSTER_NAME created successfully."