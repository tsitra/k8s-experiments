@echo off
docker image rm localhost:5000/eureka:local docker-registry:5000/eureka:local
docker image build -f .\eureka.dockerfile --tag docker-registry:5000/eureka:local .
docker push docker-registry:5000/eureka:local