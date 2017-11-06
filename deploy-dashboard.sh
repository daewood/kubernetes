#!/bin/bash

#kubectl create -f https://git.io/kube-dashboard

mkdir -p /etc/kubernetes/addons/certs && cd /etc/kubernetes/addons
openssl genrsa -des3 -passout pass:x -out certs/dashboard.pass.key 2048
openssl rsa -passin pass:x -in certs/dashboard.pass.key -out certs/dashboard.key
openssl req -new -key certs/dashboard.key -out certs/dashboard.csr -subj '/CN=kube-dashboard'
openssl x509 -req -sha256 -days 365 -in certs/dashboard.csr -signkey certs/dashboard.key -out certs/dashboard.crt
rm certs/dashboard.pass.key
kubectl create secret generic kubernetes-dashboard-certs --from-file=certs -n kube-system

export ADDON_URL="https://github.com/daewood/kubernetes/raw/master/addon"
wget ${ADDON_URL}/kube-dashboard.yml
kubectl apply -f kube-dashboard.yml
#kubectl -n kube-system get po,svc -l k8s-app=kubernetes-dashboard

#echo https://192.168.56.50:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

#export ADDON_URL="https://github.com/daewood/kubernetes/raw/master/addon"
wget ${ADDON_URL}/kube-monitor.yml
kubectl apply -f kube-monitor.yml
#kubectl -n kube-system get po,svc

#echo https://192.168.56.50:6443/api/v1/proxy/namespaces/kube-system/services/monitoring-grafana
