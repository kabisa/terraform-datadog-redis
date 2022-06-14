variable "evicted_keys_enabled" {
  type        = bool
  default     = true
  description = "eviction in redis"
}

variable "evicted_keys_warning" {
  type    = number
  default = 10
  # 10 evictions
}

variable "evicted_keys_critical" {
  type    = number
  default = 20
  # 20 evictions
}

variable "evicted_keys_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "evicted_keys_severity" {
  type    = string
  default = "critical"
}

variable "evicted_keys_note" {
  type    = string
  default = ""
}

variable "evicted_keys_docs" {
  type    = string
  default = ""
}

variable "evicted_keys_filter_override" {
  type    = string
  default = ""
}

variable "evicted_keys_alerting_enabled" {
  type    = bool
  default = true
}

variable "evicted_keys_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}
