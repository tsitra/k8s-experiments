FROM ubuntu:noble AS base

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git 
RUN apt-get install -y curl 
RUN apt-get install -y bash
RUN apt-get install -y openjdk-21-jdk
RUN mkdir -p /app/src
WORKDIR /app/src

FROM base AS builder
COPY --chown=root ./eureka-server /app/src
RUN /app/src/mvnw package -DskipTests=true

FROM base AS runner
COPY --from=builder /app/src/target/*.jar /app/src/app.jar

ENTRYPOINT ["java", "-jar", "/app/src/app.jar"]