#!/bin/bash
echo "Archivage des journaux d'evenements..."
DATE_TAG=$(date +%Y%m%d)
tar -czf logs_${DATE_TAG}.tar.gz logs/
echo "Archive logs_${DATE_TAG}.tar.gz creee."
