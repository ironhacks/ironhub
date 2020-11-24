#!/bin/bash

docker \
  container ls -a \
  --format "{{.ID}}, {{.Names}}, {{.Status}}, {{.Size}}" \
  | column -t -s ","
