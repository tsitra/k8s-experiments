#!/usr/bin/env bash
@echo off
docker image rm localhost:5000/eureka:local && \
docker image build -f ./eureka.dockerfile --tag localhost:5000/eureka:local . && \
docker push localhost:5000/eureka:local && \
docker image save -o eureka-local.tar localhost:5000/eureka:local && \
minikube image load ./eureka-local.tar
kubectl apply -f ./eureka-server-combined.yaml