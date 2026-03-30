#!/bin/bash
echo "Lecture des 30 dernieres lignes du journal :"
tail -n 30 logs/app.log
