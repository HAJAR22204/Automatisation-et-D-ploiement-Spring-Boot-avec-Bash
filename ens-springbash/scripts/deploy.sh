#!/bin/bash
echo "Demarrage de la compilation..."
mvn clean package -DskipTests
echo "Execution de la nouvelle version..."
mkdir -p logs
java -jar target/*.jar > logs/deploy.log 2>&1 &
echo "Deploiement termine. PID: $!"
