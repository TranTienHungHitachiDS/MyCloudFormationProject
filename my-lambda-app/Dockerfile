# Build stage
FROM maven:3.8.3-openjdk-17 AS build-stage

## Change directory
WORKDIR /app

## Download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

## Build code
COPY src ./src
RUN mvn install -DskipTests=true


# Run Stage
FROM public.ecr.aws/lambda/java:17 AS run-stage

## Copy the JAR into the container
COPY target/my-lambda-app-1.0-SNAPSHOT.jar ${LAMBDA_TASK_ROOT}/lib/

## Set the handler class
CMD ["com.hungtran.Handler::handleRequest"]
