# Rails MySQL Timeouts

This repo contains the source code which we use to experiment with Rails MySQL timeouts.

## Getting Started

We use Docker to provision fresh environments for our application, so make sure the following dependencies are installed:

- [Docker](https://docs.docker.com/engine/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)


With the dependencies installed, run make to get started. This creates two MySQL databases and Ruby environment for Rails, and opens an interactive TTY into this environment. See [`docker-compose.yml`](docker-compose.yml) for more details.


```bash
make
```

Now we can open an interactive shell into our Rails environment:

```
make ssh
```
