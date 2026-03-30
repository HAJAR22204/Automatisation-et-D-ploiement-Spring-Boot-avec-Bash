#!/bin/bash
echo "Verification de la disponibilite du service..."
curl -s http://localhost:8085/actuator/health
echo ""
