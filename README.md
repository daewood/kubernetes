# Devops


Tools&scripts for devops.

**Contents**

- Container/docker management
- Kubernetes deployment&management
- Networking experiments

## Get the scripts

```sh
git clone https://github.com/daewood/kubernetes.git
cd kubernetes
```

## Docker

- Install docker v1.13: `install-docker.sh`
- Install docker latest: `export DOCKER_VERSION="latest" && kubernetes/install-docker.sh`

## Kubernetes

### Create a kubernetes cluster master
You need cancel you swap first. kubelet will not start if there is sawp. sudo swapoff -a and edit your /etc/fstab
- Install kubernetes with docker: `install-kubernetes.sh`
- Install kubernetes with frakti: `install-kubernetes-frakti.sh`

### Add a new node

Setup token and CIDR first.

```sh
# replace this with yours.
export TOKEN="xxxx"
export MASTER_IP="x.x.x.x"
export CONTAINER_CIDR="10.244.2.0/24"
```

- Add a new node with docker runtime: `add-docker-node.sh`
- Add a new node with frakti runtime: `add-hyper-node.sh`

## vagrant

### private network
```sh
#added to lib/kubeadm.yaml
api:
  advertiseAddress: "x.x.x.x"
```
