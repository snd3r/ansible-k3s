# [Draft] Ansible role to install K3S

## What is K3s?

K3s is a fully compliant Kubernetes distribution with the following enhancements:

Packaged as a single binary.

Lightweight storage backend based on sqlite3 as the default storage mechanism. etcd3, MySQL, Postgres also still available.

Wrapped in simple launcher that handles a lot of the complexity of TLS and options.

Secure by default with reasonable defaults for lightweight environments.

Simple but powerful “batteries-included” features have been added, such as: a local storage provider, a service load balancer, a Helm controller, and the Traefik ingress controller.

Operation of all Kubernetes control plane components is encapsulated in a single binary and process. This allows K3s to automate and manage complex cluster operations like distributing certificates.

External dependencies have been minimized (just a modern kernel and cgroup mounts needed). K3s packages required dependencies, including:

- containerd
- Flannel
- CoreDNS
- CNI
- Host utilities (iptables, socat, etc)
- Ingress controller (traefik)
- Embedded service loadbalancer
- Embedded network policy controller

## What’s with the name?

We wanted an installation of Kubernetes that was half the size in terms of memory footprint. Kubernetes is a 10-letter word stylized as K8s. So something half as big as Kubernetes would be a 5-letter word stylized as K3s. There is no long form of K3s and no official pronunciation.

## Prerequisites

Ansible 2.8

## Run playbook

Deploy cluster:

```sh
ansible-playbook -u root --key-file=~/.ssh/id_rsa -i inventory/hosts.ini deploy.yaml
```

Reset cluster:

```sh
ansible-playbook -u root --key-file=~/.ssh/id_rsa -i inventory/hosts.ini reset.yaml
