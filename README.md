# Rails MySQL Timeouts

This repo contains the source code which we use to experiment with Rails MySQL timeouts.

## Getting Started

### Dependencies

- [Docker](https://docs.docker.com/engine/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Toxiproxy CLI](https://github.com/Shopify/toxiproxy)


With the dependencies installed, run make to get started. This creates two MySQL databases and Ruby environment for Rails, and opens an interactive TTY into this environment. See [`docker-compose.yml`](docker-compose.yml) for more details.


```bash
make
```

Now we can open an interactive shell into our Rails environment:

```
make ssh
```

## Other Commands

- `make disable_db` disables transmission of data to `db_other`
- `make enable_db` reenables transmission of data to `db_other` after it has been disabled


## Appendix

We use the following versions for our application

- Ruby `2.4.2-p198`
- Rails `5.1.4`
- Debian Jessie for the [Ruby Docker image](https://hub.docker.com/_/ruby/)
- MySQL `5.7.20`

### Experimental Data

| Scenario | `connect_timeout` | `read_timeout` | Duration           |
|----------|-------------------|----------------|--------------------|
| 1        | -                 | -              | 120.90             |
| 1        | empty value       | empty value    | Does not terminate |
| 1        | 1                 | -              | 2.06               |
| 1        | 5                 | -              | 6.05               |
| 1        | 10                | -              | 11.05              |
| 1        | -                 | 1              | 120.98             |
| 1        | 10                | 1              | 11.05              |
| 1        | 10                | 5              | 11.05              |
| 2        | 5                 | 5              | 11.04              |
| 2        | 10                | 5              | 16.08              |
| 2        | 5                 | 10             | 16.23              |
| 2        | 5                 | -              | Does not terminate |
| 2        | -                 | 10             | 131.31             |

Note that the `-` symbol for the timeouts indicate that the key is removed from the `database.yml` entirely, while an empty value means that the keys have empty values in the configuration i.e.

```yaml
connect_timeout: 
```

The requests in the experiment all fail with the following error:

```
Started GET "/passengers" for 172.18.0.1 at 2017-11-18 06:11:37 +0000
Processing by PassengersController#index as */*
Completed 500 Internal Server Error in 16069ms

Mysql2::Error (Can't connect to MySQL server on 'db_other' (4)):

app/controllers/passengers_controller.rb:8:in `index`
```
