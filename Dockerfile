
FROM maven:3.8.2-jdk-8-slim AS stage1
WORKDIR /home/app
COPY . /home/app/
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8
# ONBUILD ADD target/pipeline-0.0.1-SNAPSHOT.jar pipeline.jar
EXPOSE 5000
COPY --from=stage1  /home/app/target/pipeline-0.0.1-SNAPSHOT.jar pipeline.jar
ENTRYPOINT [ "sh", "-c",  "java","-jar","pipeline.jar" ]
# RUN mvn -f /home/app/pom.xml clean package