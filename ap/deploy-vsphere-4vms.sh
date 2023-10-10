#!/bin/bash

BOSH_ENVIRONMENT="${BOSH_ENVIRONMENT}"			 # bosh director alias name (K-PaaS에서 제공되는 create-bosh-login.sh 미 사용시 bosh envs에서 이름을 확인하여 입력)

bosh -e ${BOSH_ENVIRONMENT} -d ap -n deploy min-ap-deployment.yml \
        -o operations/min-use-router-public-network.yml \
        -o operations/min-use-router-public-network-vsphere.yml \
        -o operations/min-use-postgres.yml \
        -o operations/min-rename-network-and-deployment.yml \
        -o operations/min-cce.yml \
        -l min-vars.yml \
        -l ../../common/common_vars.yml

