#!/bin/bash

#kubectl create -f https://git.io/kube-dashboard
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
