#!/bin/bash
set -e

mkdir -p output

echo "Building pyswisseph for AWS Lambda (Python 3.11, x86_64)..."

podman run --rm \
  --platform linux/amd64 \
  -v "$(pwd)/output:/output" \
  public.ecr.aws/lambda/python:3.11 \
  bash -c "pip install pyswisseph -t /tmp/python && cd /tmp && zip -r /output/pyswisseph-layer.zip python/"

echo "Done: output/pyswisseph-layer.zip"
