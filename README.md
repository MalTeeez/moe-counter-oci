## moe-counter-docker
This simple repo packages moe-counter [journey-ad/Moe-Counter](https://github.com/journey-ad/Moe-Counter) as an oci image that self-updates on restart without me needing to re-push on every update.

To run it with docker, simply do:
```
docker run -d -p 3000:3000 malteeez/moe-counter
```