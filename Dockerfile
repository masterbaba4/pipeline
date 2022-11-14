FROM openjdk:8
FROM maven:3.8.2-jdk-8-slim AS stage1
WORKDIR /home/app
COPY . /home/app/
RUN mvn -f /home/app/pom.xml clean package
ONBUILD ADD target/pipeline-0.0.1-SNAPSHOT.jar pipeline.jar
EXPOSE 5000
ENTRYPOINT [ "sh", "-c",  "java","-jar","pipeline-0.0.1-SNAPSHOT.jar" ]