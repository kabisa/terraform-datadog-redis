
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Redis

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator

Monitors:
* [Terraform module for Datadog Redis](#terraform-module-for-datadog-redis)
  * [Evicted Keys](#evicted-keys)
  * [Blocked Clients](#blocked-clients)
  * [Connected Clients](#connected-clients)
  * [Hitratio](#hitratio)
  * [Memory Free Bytes](#memory-free-bytes)
  * [Memory Fragmentation](#memory-fragmentation)
  * [Oom Error](#oom-error)
  * [Memory Used Percentage](#memory-used-percentage)
  * [Latency](#latency)
  * [Module Variables](#module-variables)

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you cloud a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Evicted Keys

Query:
```terraform
avg(last_5m):avg:redis.keys.evicted{tag:xxx} >= 20
```

| variable                       | default  | required | description                      |
|--------------------------------|----------|----------|----------------------------------|
| evicted_keys_enabled           | True     | No       | eviction in redis                |
| evicted_keys_warning           | 10       | No       |                                  |
| evicted_keys_critical          | 20       | No       |                                  |
| evicted_keys_evaluation_period | last_5m  | No       |                                  |
| evicted_keys_note              | ""       | No       |                                  |
| evicted_keys_docs              | ""       | No       |                                  |
| evicted_keys_filter_override   | ""       | No       |                                  |
| evicted_keys_alerting_enabled  | True     | No       |                                  |
| evicted_keys_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Blocked Clients

Query:
```terraform
avg(last_5m):avg:redis.clients.blocked{tag:xxx} >= 10
```

| variable                          | default  | required | description                      |
|-----------------------------------|----------|----------|----------------------------------|
| blocked_clients_enabled           | True     | No       | blocked in redis                 |
| blocked_clients_warning           | 5        | No       |                                  |
| blocked_clients_critical          | 10       | No       |                                  |
| blocked_clients_evaluation_period | last_5m  | No       |                                  |
| blocked_clients_note              | ""       | No       |                                  |
| blocked_clients_docs              | ""       | No       |                                  |
| blocked_clients_filter_override   | ""       | No       |                                  |
| blocked_clients_alerting_enabled  | True     | No       |                                  |
| blocked_clients_priority          | 2        | No       | Number from 1 (high) to 5 (low). |


## Connected Clients

Query:
```terraform
avg(last_5m):avg:redis.net.clients{tag:xxx} >= 800
```

| variable                            | default  | required | description                      |
|-------------------------------------|----------|----------|----------------------------------|
| connected_clients_enabled           | True     | No       | connected_clients in redis       |
| connected_clients_warning           | 600      | No       |                                  |
| connected_clients_critical          | 800      | No       |                                  |
| connected_clients_evaluation_period | last_5m  | No       |                                  |
| connected_clients_note              | ""       | No       |                                  |
| connected_clients_docs              | ""       | No       |                                  |
| connected_clients_filter_override   | ""       | No       |                                  |
| connected_clients_alerting_enabled  | True     | No       |                                  |
| connected_clients_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Hitratio

Query:
```terraform
avg(last_5m):( avg:redis.stats.keyspace_hits{tag:xxx} / ( avg:redis.stats.keyspace_hits{tag:xxx} + avg:redis.stats.keyspace_misses{tag:xxx} ) ) * 100 <= 40
```

| variable                   | default  | required | description                      |
|----------------------------|----------|----------|----------------------------------|
| hitratio_enabled           | True     | No       | hitratio in redis                |
| hitratio_warning           | 50       | No       |                                  |
| hitratio_critical          | 40       | No       |                                  |
| hitratio_evaluation_period | last_5m  | No       |                                  |
| hitratio_note              | ""       | No       |                                  |
| hitratio_docs              | ""       | No       |                                  |
| hitratio_filter_override   | ""       | No       |                                  |
| hitratio_alerting_enabled  | True     | No       |                                  |
| hitratio_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Memory Free Bytes

Query:
```terraform
avg(last_5m):avg:redis.mem.maxmemory{tag:xxx} - avg:redis.mem.used{tag:xxx} < 500000000
```

| variable                            | default    | required | description                      |
|-------------------------------------|------------|----------|----------------------------------|
| memory_free_bytes_enabled           | True       | No       | Memory free in redis             |
| memory_free_bytes_warning           | 1000000000 | No       |                                  |
| memory_free_bytes_critical          | 500000000  | No       |                                  |
| memory_free_bytes_evaluation_period | last_5m    | No       |                                  |
| memory_free_bytes_note              | ""         | No       |                                  |
| memory_free_bytes_docs              | ""         | No       |                                  |
| memory_free_bytes_filter_override   | ""         | No       |                                  |
| memory_free_bytes_alerting_enabled  | True       | No       |                                  |
| memory_free_bytes_priority          | 2          | No       | Number from 1 (high) to 5 (low). |


## Memory Fragmentation

Query:
```terraform
avg(last_5m):avg:redis.mem.fragmentation_ratio{tag:xxx} > 1.5
```

| variable                               | default  | required | description                                                  |
|----------------------------------------|----------|----------|--------------------------------------------------------------|
| memory_fragmentation_enabled           | True     | No       | memfrag in redis                                             |
| memory_fragmentation_warning           | 1.1      | No       | more then 1 single memory block is already a sign of trouble |
| memory_fragmentation_critical          | 1.5      | No       | Memory fragmentation above 1.5 means trouble                 |
| memory_fragmentation_evaluation_period | last_5m  | No       |                                                              |
| memory_fragmentation_note              | ""       | No       |                                                              |
| memory_fragmentation_docs              | ""       | No       |                                                              |
| memory_fragmentation_filter_override   | ""       | No       |                                                              |
| memory_fragmentation_alerting_enabled  | True     | No       |                                                              |
| memory_fragmentation_priority          | 3        | No       | Number from 1 (high) to 5 (low).                             |


## Oom Error

Query:
```terraform
logs(\"OOM command not allowed when used memory \\> 'maxmemory'.\").index(\"*\").rollup(\"count\").last(\"15m\") > 5
```

| variable                    | default   | required | description                      |
|-----------------------------|-----------|----------|----------------------------------|
| oom_error_enabled           | True      | No       | oom_error in redis               |
| oom_error_warning           | 1         | No       |                                  |
| oom_error_critical          | 5         | No       |                                  |
| oom_error_evaluation_period | last_5m   | No       |                                  |
| oom_error_note              | ""        | No       |                                  |
| oom_error_docs              | ""        | No       |                                  |
| oom_error_filter_override   | ""        | No       |                                  |
| oom_error_alerting_enabled  | True      | No       |                                  |
| oom_error_type              | log alert | No       |                                  |
| oom_error_priority          | 2         | No       | Number from 1 (high) to 5 (low). |


## Memory Used Percentage

Query:
```terraform
avg(last_5m):( avg:redis.mem.used{tag:xxx} / avg:redis.mem.maxmemory{tag:xxx} ) * 100 >= 95
```

| variable                                 | default  | required | description                      |
|------------------------------------------|----------|----------|----------------------------------|
| memory_used_percentage_enabled           | True     | No       | maxmem in redis                  |
| memory_used_percentage_warning           | 80       | No       |                                  |
| memory_used_percentage_critical          | 95       | No       |                                  |
| memory_used_percentage_evaluation_period | last_5m  | No       |                                  |
| memory_used_percentage_note              | ""       | No       |                                  |
| memory_used_percentage_docs              | ""       | No       |                                  |
| memory_used_percentage_filter_override   | ""       | No       |                                  |
| memory_used_percentage_alerting_enabled  | True     | No       |                                  |
| memory_used_percentage_priority          | 2        | No       | Number from 1 (high) to 5 (low). |


## Latency

Query:
```terraform
avg(last_15m):avg:redis.info.latency_ms{tag:xxx} >= 25
```

| variable                  | default  | required | description                      |
|---------------------------|----------|----------|----------------------------------|
| latency_enabled           | True     | No       | Latency in redis                 |
| latency_warning           | None     | No       |                                  |
| latency_critical          | 25       | No       |                                  |
| latency_evaluation_period | last_15m | No       |                                  |
| latency_note              | ""       | No       |                                  |
| latency_docs              | ""       | No       |                                  |
| latency_filter_override   | ""       | No       |                                  |
| latency_alerting_enabled  | True     | No       |                                  |
| latency_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable             | default  | required | description  |
|----------------------|----------|----------|--------------|
| env                  |          | Yes      |              |
| alert_env            |          | Yes      |              |
| service              | Redis    | No       |              |
| notification_channel |          | Yes      |              |
| additional_tags      | []       | No       |              |
| filter_str           |          | Yes      |              |
| locked               | True     | No       |              |


