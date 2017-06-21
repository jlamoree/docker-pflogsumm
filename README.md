# Docker Postfix Log Entry Summarizer

[pflogsumm](https://jimsun.linxnet.com/postfix_contrib.html) in a minimal Alpine Linux container.

## Usage

```bash
cat smtp.log | docker run --rm docker.io/panubo/pflogsumm > report.txt
```
