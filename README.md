# Local Supabase

This repository provides a single-tenant local setup of
[Supabase](https://supabase.com).

## Prerequisites

* Docker
* GNU make
* The following ports must be unused:
    * 3000 - Supabase Studio
    * 4000 - Logflare
    * 5432 - Postgres
    * 8000 - Supabase
    * 8080 - Imgproxy

## Usage

### Installation

```bash
# Initialize Supabase
make install
```

### Running

```bash
cd supabase/docker


# Start Supabase
docker compose up -d

# Stop Supabase
docker compose down
```

### Local Dashboard

* [http://localhost:8000](http://localhost:8000)

## Patches

* [docker-compose.patch](patches/docker-compose.patch)
  
  Patch the Supabase docker-compose.yaml file so that Postgres uses a named
  volume instead of a host directory mount. This is necessary because the
  Postgres container will try to change the owner of the mounted path.

## See Also

* [Self-Hosting with Docker @ Supabase Documentation](https://supabase.com/docs/guides/self-hosting/docker)
* [Supabase Documentation](https://supabase.com/docs)
