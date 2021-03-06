#!/bin/bash

set -eux

pip install --user awscli
export PATH=$PATH:$HOME/.local/bin
eval $(aws ecr get-login --region eu-west-1 --no-include-email)
docker tag ${DOCKER_TAG_NAME}:${VERSION_NUMBER} ${ECR_REPOSITORY}:${VERSION_NUMBER}
docker push ${ECR_REPOSITORY}:${VERSION_NUMBER}

