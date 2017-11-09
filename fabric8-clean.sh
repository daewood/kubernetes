#!/bin/bash
kubectl delete rc -l provider=fabric8
kubectl delete rs -l provider=fabric8
kubectl delete service -l provider=fabric8
kubectl delete secret -l provider=fabric8
kubectl delete ingress -l provider=fabric8
kubectl delete configmap -l provider=fabric8
kubectl delete configmap -l provider=fabric8.io
kubectl delete sa -l provider=fabric8
kubectl delete ns -l provider=fabric8
