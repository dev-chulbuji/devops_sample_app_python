#!/bin/bash


aws deploy create-deployment \
    --application-name jenkins-slave-codedeploy-app \
    --deployment-group-name jenkins-slave-codedeploy-group \
    --region ap-northeast-2 \
    --s3-location bucket=jenkins-slave-artifact-codebuild-s3,bundleType=zip,key=jenkins-slave-codebuild \
    --file-exists-behavior OVERWRITE \
    --output json > DEPLOYMENT_ID.json

cat DEPLOYMENT_ID.json
