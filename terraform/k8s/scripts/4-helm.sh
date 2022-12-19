#!/bin/bash

### helm: install
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

### Clone Git repository
su - ubuntu -c "git clone https://github.com/lukassokol/ONPK_Practical_Exam"

### Deploy mongose
helm upgrade --install --force mongodb bitnami/mongodb --values ONPK_Practical_Exam/helm/basics/values.yaml --wait

### Deploy backend app
cd ONPK_Practical_Exam/helm/apps/appbackend/
helm dependency update
helm install appbackend . --values values-appbackend.yaml --wait

### Deploy frontend app
cd ../../../../
helm install appfrontend ONPK_Practical_Exam/helm/apps/appfrontend --values ONPK_Practical_Exam/helm/apps/appfrontend/values-appfrontend.yaml --wait

