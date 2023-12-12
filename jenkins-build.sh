#!/bin/bash

cd app

mvn clean install
mvn package

./mvnw clean package -DskipTests=true
chmod +x ./mvnw
./mvnw -ntp verify -P-webpack -Pprod -DskipTests -Dcheckstyle.skip

cd ..
archiveArtifacts artifacts: 'target/*.jar', fingerprint: true

cd api
mvn clean compile jib:dockerBuild

cd ../web
docker build --no-cache -t falchi/front:latest .

chmod +x jenkins.sh
./jenkins.sh

