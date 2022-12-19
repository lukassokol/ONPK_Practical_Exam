#!/bin/bash

### Tekton Pipelines: install
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

### Tekton Dashboard: install
kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml

### Tekton cli: install
curl -LO https://github.com/tektoncd/cli/releases/download/v0.28.0/tkn_0.28.0_Linux_x86_64.tar.gz
sudo tar xvzf tkn_0.28.0_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn

### Install Tasks: git-clone, helm-upgrade-from-source, buildah/kaniko

### buildah
kubectl apply -f https://api.hub.tekton.dev/v1/resource/tekton/task/buildah/0.5/raw

### helm-upgrade-from-source
kubectl apply -f https://api.hub.tekton.dev/v1/resource/tekton/task/helm-upgrade-from-source/0.3/raw

### git-clone
kubectl apply -f https://api.hub.tekton.dev/v1/resource/tekton/task/git-clone/0.9/raw

### Add ServiceAccount with Secrets
kubectl apply -f ONPK_Practical_Exam/ci-cd/dockerio-secret-example.yaml
kubectl apply -f ONPK_Practical_Exam/ci-cd/service-account.yaml

# ### Add Pipelines
kubectl apply -f ONPK_Practical_Exam/ci-cd/ci-build-push-dockerhub-pipeline.yaml
kubectl apply -f ONPK_Practical_Exam/ci-cd/cd-helm-deploy-app-pipeline.yaml

# ### Add Pipeline-runs
# kubectl create -f ONPK_Practical_Exam/ci-cd/ci-build-push-appbackend-pipeline-run.yaml
# kubectl create -f ONPK_Practical_Exam/ci-cd/ci-build-push-appfrontend-pipeline-run.yaml

# kubectl create -f ONPK_Practical_Exam/ci-cd/cd-helm-deploy-appbackend-run.yaml
# kubectl create -f ONPK_Practical_Exam/ci-cd/cd-helm-deploy-appfrontend-run.yaml


