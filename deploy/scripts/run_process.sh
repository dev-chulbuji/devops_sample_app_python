#!/bin/bash

ECR_DOCKER_IMAGE="657976307134.dkr.ecr.ap-northeast-2.amazonaws.com/demo"
ECR_DOCKER_TAG="1.0.0"

export IMAGE=$(ECR_DOCKER_IMAGE) && export TAG=$(ECR_DOCKER_TAG)
docker-compose -f docker-compose.yml up -d