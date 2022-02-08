#!/bin/bash

function main() {
    kind create cluster --name "${1:-istio}"
    pullAllImages
    loadImagesInKind
}

function pullAllImages() {
    docker pull docker.io/grafana/grafana:8.1.2
    docker pull docker.io/istio/pilot:1.12.2
    docker pull docker.io/istio/proxyv2:1.12.2
    docker pull docker.io/jaegertracing/all-in-one:1.23
    docker pull docker.io/jimmidyson/configmap-reload:v0.5.0
    docker pull docker.io/kindest/kindnetd:v20210326-1e038dc5
    docker pull docker.io/prom/prometheus:v2.26.0
    docker pull docker.io/radial/busyboxplus:curl
    docker pull docker.io/rancher/local-path-provisioner:v0.0.14
    docker pull docker.io/rinormaloku/happy-service:latest
    docker pull grafana/grafana:8.1.2
    docker pull jimmidyson/configmap-reload:v0.5.0
    docker pull k8s.gcr.io/coredns/coredns:v1.8.0
    docker pull k8s.gcr.io/etcd:3.4.13-0
    docker pull k8s.gcr.io/kube-apiserver:v1.21.1
    docker pull k8s.gcr.io/kube-controller-manager:v1.21.1
    docker pull k8s.gcr.io/kube-proxy:v1.21.1
    docker pull k8s.gcr.io/kube-scheduler:v1.21.1
    docker pull prom/prometheus:v2.26.0
    docker pull quay.io/kiali/kiali:v1.42
    docker pull radial/busyboxplus:curl
    docker pull rinormaloku/happy-service:latest
}

function loadImagesInKind() {
    kind load docker-image --name="istio"  \
        docker.io/grafana/grafana:8.1.2 \
        docker.io/istio/pilot:1.12.2 \
        docker.io/istio/proxyv2:1.12.2 \
        docker.io/jaegertracing/all-in-one:1.23 \
        docker.io/jimmidyson/configmap-reload:v0.5.0 \
        docker.io/kindest/kindnetd:v20210326-1e038dc5 \
        docker.io/prom/prometheus:v2.26.0 \
        docker.io/radial/busyboxplus:curl \
        docker.io/rancher/local-path-provisioner:v0.0.14 \
        docker.io/rinormaloku/happy-service:latest \
        grafana/grafana:8.1.2 \
        jimmidyson/configmap-reload:v0.5.0 \
        k8s.gcr.io/coredns/coredns:v1.8.0 \
        k8s.gcr.io/etcd:3.4.13-0 \
        k8s.gcr.io/kube-apiserver:v1.21.1 \
        k8s.gcr.io/kube-controller-manager:v1.21.1 \
        k8s.gcr.io/kube-proxy:v1.21.1 \
        k8s.gcr.io/kube-scheduler:v1.21.1 \
        prom/prometheus:v2.26.0 \
        quay.io/kiali/kiali:v1.42 \
        radial/busyboxplus:curl \
        rinormaloku/happy-service:latest
}

main "$@"