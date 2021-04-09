variable "eviction_enabled" {
  type    = bool
  default = true
  description = "eviction in redis"
}

variable "eviction_warning" {
  type    = number
  default = 10
  # 10 evictions
}

variable "eviction_critical" {
  type    = number
  default = 20
  # 20 evictions
}

variable "eviction_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "eviction_severity" {
  type    = string
  default = "critical"
}

variable "eviction_note" {
  type    = string
  default = ""
}

variable "eviction_docs" {
  type    = string
  default = ""
}

variable "eviction_filter_override" {
  type    = string
  default = ""
}

variable "eviction_alerting_enabled" {
  type    = bool
  default = true
}