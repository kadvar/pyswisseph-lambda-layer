# pyswisseph Lambda Layer

Builds a AWS Lambda Layer for [pyswisseph](https://github.com/astrorigin/pyswisseph) using Podman.

## Requirements

- [Podman](https://podman.io/)

## Build

```bash
chmod +x build.sh
./build.sh
```

Output: `output/pyswisseph-layer.zip`

## Deploy

Upload `output/pyswisseph-layer.zip` as a Lambda Layer in the AWS console or via CLI:

```bash
aws lambda publish-layer-version \
  --layer-name pyswisseph \
  --zip-file fileb://output/pyswisseph-layer.zip \
  --compatible-runtimes python3.11 \
  --compatible-architectures x86_64
```

## Runtime

- Python 3.11
- Architecture: x86_64
- Base image: `public.ecr.aws/lambda/python:3.11`
