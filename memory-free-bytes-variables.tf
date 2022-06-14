variable "memory_free_bytes_enabled" {
  type        = bool
  default     = true
  description = "Memory free in redis"
}

variable "memory_free_bytes_warning" {
  type    = number
  default = 1000000000
  # 1GB
}

variable "memory_free_bytes_critical" {
  type    = number
  default = 500000000
  # 500MB
}

variable "memory_free_bytes_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memory_free_bytes_severity" {
  type    = string
  default = "critical"
}

variable "memory_free_bytes_note" {
  type    = string
  default = <<EOF
Sometimes, when Redis is configured with no max memory limit, memory usage will eventually reach system memory, and the server will start throwing “Out of Memory” errors. At other times, Redis is configured with a max memory limit but noeviction policy. This would cause the server not to evict any keys, thus preventing any writes until memory is freed. The solution to such problems would be configuring Redis with max memory and some eviction policy. In this case, the server starts evicting keys using eviction policy as memory usage reaches the max.
EOF
}

variable "memory_free_bytes_docs" {
  type    = string
  default = ""
}

variable "memory_free_bytes_filter_override" {
  type    = string
  default = ""
}

variable "memory_free_bytes_alerting_enabled" {
  type    = bool
  default = true
}

variable "memory_free_bytes_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}