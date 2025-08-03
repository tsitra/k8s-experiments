@echo off
docker image rm localhost:5000/eureka:local
docker image build -f .\eureka-server.dockerfile --tag localhost:5000/eureka:local .
docker push localhost:5000/eureka:local
