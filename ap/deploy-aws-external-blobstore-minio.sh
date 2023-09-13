#!/bin/bash

BOSH_ENVIRONMENT="${BOSH_ENVIRONMENT}"			 # bosh director alias name (K-PaaS에서 제공되는 create-bosh-login.sh 미 사용시 bosh envs에서 이름을 확인하여 입력)

bosh -e ${BOSH_ENVIRONMENT} -d ap -n deploy ap-deployment.yml \
	-o operations/aws.yml \
	-o operations/use-haproxy.yml \
	-o operations/use-haproxy-public-network.yml \
	-o operations/use-postgres.yml \
	-o operations/rename-network-and-deployment.yml \
	-o operations/use-external-blobstore-minio.yml \
	-l operations/example-vars-files/vars-use-external-blobstore-minio.yml \
	-l vars.yml \
	-l ../../common/common_vars.yml
