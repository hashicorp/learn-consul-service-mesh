#!/bin/bash

for i in {1..1000}; do curl -s -o /dev/null -w "%{http_code}" localhost:9091; echo ""; sleep 1; done