# Consul Service Mesh Example for HashiCorp Learn

These assets are provided to show how to configure Envoy
outlier detection in HashiCorp Consul to implement
a circuit breaker for an application in a service mesh.

---

## Requirements

- [Docker Compose](https://docs.docker.com/compose/)
- [Docker](https://docs.docker.com/get-docker/)
- `curl`

## Demo Script Guide

The following files are provided as demo scripts:

- `start.sh`: Starts Consul, three services (`web`, `api-v1`, `api-v2`) with proxies,
   and Prometheus (for metrics).
- `fail.sh`: Enables error rates for `api-v2` service.
- `success.sh`: Disables error rates for `api-v2` service for successful calls.
- `request.sh`: Make repeated API calls to the `web` service to trigger the circuit
   breaker.
- `cleanup.sh`: Removes all of the instances.

### Demo Workflow

> **NOTE:** DON'T FORGET that this demo requires Docker Compose!

1. Run `start.sh`. This starts Consul in development mode and registers three
   services, `web`, `api-v1`, and `api-v2`. It also starts Prometheus to aggregate
   metrics.

1. Run `fail.sh`. This toggles an error setting in `api-v2` to mimic an error.

1. Run `request.sh` to issue 100 API requests against the `web` service. Since outlier
   detection is enabled, you will find that the circuit breaker will open and divert
   all traffic to `api-v1` while occasionally sending a request to `api-v2` to check
   its availability.

1. In another terminal, run `success.sh`. This will close the circuit breaker and
   once more divert traffic to both `api-v1` and `api-v2`.

Finally, run `cleanup.sh` to re-set your environment so that you can repeat the demo as necessary.

> **WARNING:** The `cleanup.sh` removes all instances.
