variable "cache_hitratio_enabled" {
  type        = bool
  default     = true
  description = "cache hitratio in redis"
}

variable "cache_hitratio_warning" {
  type    = number
  default = 50
  # 50 percent
}

variable "cache_hitratio_critical" {
  type    = number
  default = 40
  # 40 percent
}

variable "cache_hitratio_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "cache_hitratio_severity" {
  type    = string
  default = "critical"
}

variable "cache_hitratio_note" {
  type    = string
  default = ""
}

variable "cache_hitratio_docs" {
  type    = string
  default = <<EOF
The cache hit ratio represents the efficiency of cache usage. Mathematically, it is defined as (Total key hits)/ (Total keys hits + Total key misses).

If the cache hit ratio is lower than ~0.8 then a significant amount of the requested keys are evicted, expired, or do not exist at all. It is crucial to watch this metric while using Redis as a cache. Lower cache hit ratio results in larger latency as most of the requests are fetching data from the disk. It indicates that you need to increase the size of Redis cache to improve your application’s performance.
https://scalegrid.io/blog/6-crucial-redis-monitoring-metrics/
EOF
}

variable "cache_hitratio_filter_override" {
  type    = string
  default = ""
}

variable "cache_hitratio_alerting_enabled" {
  type    = bool
  default = true
}

variable "cache_hitratio_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}