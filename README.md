# Self-Hosted GIS Toolkit

This repository contains a `docker-compose` file and a directory structure that facilitates a self-hosted solution containing:

- a web dashboard (pictured below)
- a Jupyter Notebook app based on the [datascience-notebook](https://hub.docker.com/r/jupyter/datascience-notebook) docker image

![Web Dashboard](./dashboard.png)

# How to use

1. Generate an x509 certificate for use with TLS. For testing purposes this can be done via `cd server && ./generate_dev_certificate.sh`.
2. In the root directory of the repository run `docker-compose up`.
3. In your browser navigate to ``https://localhost``.
