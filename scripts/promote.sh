#!/bin/bash
TAG=$(git rev-parse HEAD)

docker pull njmyers/image-magick:"${TAG}"
docker tag njmyers/image-magick:"${TAG}" njmyers/image-magick:latest
docker push njmyers/image-magick:latest
