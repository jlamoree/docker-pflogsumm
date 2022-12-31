# Docker Postfix Log Entry Summarizer

[pflogsumm](https://jimsun.linxnet.com/postfix_contrib.html) in a minimal Alpine Linux container.

## Usage

```bash
docker run --rm -i -a stdin -a stdout docker.io/jlamoree/pflogsumm:latest < maillog > report.txt
```

## Build

The Alpine Linux and pflogsumm versions are now specified explicitly for repeatable builds.

See [docker-builder](https://github.com/jlamoree/docker-builder) for an example Docker Buildx configuration for multi-platform image creation.


```bash
version="1.1.5-r2"
project="pflogsumm"
username="$(whoami)"
vault_item="docker-builder-access-token"

if [ -z "$vault_item" ]; then
  op item get "$vault_item" --fields label=password | \
    docker login --username "$username" --password-stdin
fi
docker buildx use builders
docker buildx build --platform=linux/amd64,linux/arm64 \
  --build-arg VERSION="$version" \
  --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  --tag "${username}/${project}:${version}" \
  --tag "${username}/${project}:latest" \
  --push .
```
