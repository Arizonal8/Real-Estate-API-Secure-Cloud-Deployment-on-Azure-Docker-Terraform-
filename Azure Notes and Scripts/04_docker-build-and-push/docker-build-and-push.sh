#!/bin/bash
# Build and push Docker image

IMAGE="arizonal8/realestate-api-lab"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Logging into Docker Hub..."
docker login

echo "Pushing image..."
docker push $IMAGE

echo "Docker build and push complete."
