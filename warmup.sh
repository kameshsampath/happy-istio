#!/bin/bash

## since we will be use Istio Ingress as the default Gateway/Ingress
## delete the default traefik deployment/service
kubectl delete -n kube-system  svc/traefik deploy/traefik &>/dev/null || true

nerdctl -n k8s.io pull docker.io/grafana/grafana:8.1.2
nerdctl -n k8s.io pull docker.io/istio/pilot:1.12.2
nerdctl -n k8s.io pull docker.io/istio/proxyv2:1.12.2
nerdctl -n k8s.io pull docker.io/jaegertracing/all-in-one:1.23
nerdctl -n k8s.io pull docker.io/jimmidyson/configmap-reload:v0.5.0
nerdctl -n k8s.io pull docker.io/prom/prometheus:v2.26.0
nerdctl -n k8s.io pull docker.io/radial/busyboxplus:curl
nerdctl -n k8s.io pull docker.io/rancher/local-path-provisioner:v0.0.14
nerdctl -n k8s.io pull docker.io/rinormaloku/happy-service:latest
nerdctl -n k8s.io pull grafana/grafana:8.1.2
nerdctl -n k8s.io pull jimmidyson/configmap-reload:v0.5.0
nerdctl -n k8s.io pull prom/prometheus:v2.26.0
nerdctl -n k8s.io pull quay.io/kiali/kiali:v1.42
nerdctl -n k8s.io pull radial/busyboxplus:curl
nerdctl -n k8s.io pull rinormaloku/happy-service:latest