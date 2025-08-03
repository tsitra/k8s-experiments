@echo off
kubectl create ns kafka
helm repo add strimzi https://strimzi.io/charts/
helm repo update
helm install strimzi strimzi/strimzi-kafka-operator -n kafka
kubectl apply -f .\kafka-server-combined.yaml -n kafka
