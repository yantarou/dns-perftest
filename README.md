# dns-perftest

## About

Docker containers and DNS query data files for testing DNS performance with `dnsperf`, `firefox`, `flamethrower`, `resperf` and `resperf-report`.

* https://github.com/DNS-OARC/flamethrower
* https://github.com/DNS-OARC/dnsperf


## Preparing Git and Docker

Initialize and update the Git submodule for `flamethrower`:

```
git submodule update --init
```

Install Docker:

* https://www.docker.com/community-edition

Install Docker Compose:

* https://github.com/docker/compose


## Building the Docker Containers

```
docker build --network host --tag dnsperf \
    -f dnsperf/Dockerfile dnsperf
```

```
docker build --network host --tag firefox \
    -f firefox/Dockerfile firefox
```

```
docker build --network host --tag flamethrower \
    -f flamethrower/Dockerfile flamethrower
```

```
docker build --network host --tag resperf \
    -f resperf/Dockerfile resperf
```

```
docker build --network host --tag resperf-report \
    -f resperf-report/Dockerfile resperf-report
```

## Testing the Docker Containers

```
docker run --rm dnsperf -h
```

```
docker run --rm firefox --help
```

```
docker run --rm flamethrower --help
```

```
docker run --rm resperf -h
```

```
docker run --rm resperf-report -h
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

Run `resperf-report` with the top 100k query data file:

```
docker run \
    --rm -it --net host \
    -v $(pwd)/query_data_files:/mnt/query_data_files \
    -v $(pwd):/mnt/wd \
    -w /mnt/wd \
    resperf-report \
        -d /mnt/query_data_files/top-100k.qd.txt \
        -s 127.0.0.1

        -s 127.0.0.1 -p 5353 -c 180 -m 10000
        -s 127.0.0.1 -L 10 -p 5353 -c 180 -m 10000
```

See the tools' command line options for other available options.


## Running Firefox with a specific DNS server

To run `firefox` (on Linux) with a specific DNS server:

```
docker run \
    --rm -it --net host \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
    --env="DISPLAY" \
    --dns 127.0.0.1 \
    --shm-size 2g \
    firefox
```


## Query Data Files

The query data files have been created from the CSV files provided by [Cisco Umbrella](https://umbrella.cisco.com/):

* https://umbrella.cisco.com/blog/2016/12/14/cisco-umbrella-1-million/

For simplicity, the query data files currently only contain `A` records.


## Using Docker Compose

To run multiple instances of Flamethrower concurrently, Docker Compose may be used.

The target's IP address and port number, the desired query data file, the traffic generation limit and QPS rate have to be defined on the command line accordingly.

```
TARGET_IP="127.0.0.1" \
TARGET_PORT="53" \
QUERY_DATA_FILE="top-1m.qd.txt" \
TIME_LIMIT="600" \
QPS="20000" \
docker-compose \
    --file docker_compose/flamethrower-query-data-file.yml \
    up \
    --scale flamethrower=3
```
