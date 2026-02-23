#!/bin/bash
set -e

mkdir -p output

echo "Building pyswisseph for AWS Lambda (Python 3.11, x86_64)..."

podman run --rm \
  --platform linux/amd64 \
  --entrypoint bash \
  -v "$(pwd)/output:/output" \
  public.ecr.aws/lambda/python:3.11 \
  -c "pip install pyswisseph -t /tmp/python && cd /tmp && python3 -c \"import shutil; shutil.make_archive('/output/pyswisseph-layer', 'zip', '/tmp', 'python')\""

echo "Done: output/pyswisseph-layer.zip"
