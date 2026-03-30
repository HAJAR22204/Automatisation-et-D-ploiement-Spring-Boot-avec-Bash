#!/bin/bash
echo "Arret du processus applicatif..."
APP_PID=$(ps aux | grep 'spring-boot:run' | grep -v grep | awk '{print $2}')
if [ -z "$APP_PID" ]; then
  echo "Aucune instance active detectee."
else
  kill -9 $APP_PID
  echo "Processus $APP_PID interrompu."
fi
