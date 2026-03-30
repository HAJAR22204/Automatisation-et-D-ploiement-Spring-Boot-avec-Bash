#!/bin/bash
echo "Initialisation du service Spring Boot..."
mkdir -p logs
nohup mvn spring-boot:run > logs/app.log 2>&1 &
echo "Service lance avec succes. PID: $!"
