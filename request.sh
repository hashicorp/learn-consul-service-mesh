#!/bin/bash

for i in {1..1000}; do curl -s localhost:9091 | jq -r '.upstream_calls."http://localhost:9092" | "\(.name),\(.code)"' ; sleep 1; done