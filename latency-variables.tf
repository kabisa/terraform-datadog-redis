variable "latency_enabled" {
  type        = bool
  default     = true
  description = "Latency in redis"
}

variable "latency_warning" {
  type    = number
  default = null
}

variable "latency_critical" {
  type    = number
  default = 25
  # 25MS
}

variable "latency_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "latency_note" {
  type    = string
  default = ""
}

variable "latency_docs" {
  type    = string
  default = ""
}

variable "latency_filter_override" {
  type    = string
  default = ""
}

variable "latency_alerting_enabled" {
  type    = bool
  default = true
}

variable "latency_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
