#!/bin/bash

function install() {
  helm repo add bitnami https://charts.bitnami.com/bitnami

  helm install postgres bitnami/postgresql -f ./postgresql.yml
  helm install userservice ./userservice-chart
  return
}

function destroy() {
  helm uninstall userservice
  helm uninstall postgres
  return
}

case "$1" in
"install")
  install
  ;;
"destroy")
  destroy
  ;;
esac