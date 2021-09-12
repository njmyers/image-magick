#!/bin/bash
TAG=$(git rev-parse HEAD)
TAG="${TAG}" bash -c "docker buildx bake --push executable"
