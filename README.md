# dns-perftest

## About

Docker containers and DNS query data files for testing DNS
performance with `flamethrower`, `resperf` and `dnsperf`.

* https://github.com/DNS-OARC/flamethrower
* https://github.com/DNS-OARC/dnsperf


## Preparing Git and Docker

Initialize and update the Git submodule:

```
git submodule update --init
```

Install Docker:

https://www.docker.com/community-edition


## Building the Docker Containers

```
docker build --network host --tag flamethrower \
    -f flamethrower/Dockerfile flamethrower
```

```
docker build --network host --tag resperf \
    -f resperf/Dockerfile resperf
```

```
docker build --network host --tag dnsperf \
    -f dnsperf/Dockerfile dnsperf
```


## Testing the Docker Containers

```
docker run --rm -it --net host flamethrower --help
```

```
docker run --rm -it --net host resperf -h
```

```
docker run --rm -it --net host dnsperf -h
```


## Usage Examples

Run `flamethrower` with the top 100k domains query data file:

```
docker run \
    --rm -it --net host \
    -v $(pwd)/query_data_files:/mnt/query_data_files \
    flamethrower \
        -f /mnt/query_data_files/top-100k.qd.txt \
        192.0.2.1
```

Run `resperf` with the top 1m query data file:

```
docker run \
    --rm -it --net host \
    -v $(pwd)/query_data_files:/mnt/query_data_files \
    resperf \
        -d /mnt/query_data_files/top-1m.qd.txt \
        -s 192.0.2.1
```

See the tools' command line options for other available options.


## Query Data Files

The query data files have been created from the CSV files provided by [Cisco Umbrella](https://umbrella.cisco.com/):

* https://umbrella.cisco.com/blog/2016/12/14/cisco-umbrella-1-million/

For simplicity, the query data files currently only contain `A` records.
