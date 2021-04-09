variable "latency_enabled" {
  type        = bool
  default     = true
  description = "Latency in redis"
}

variable "latency_warning" {
  type    = number
  default = 8
  # 8MS
}

variable "latency_critical" {
  type    = number
  default = 10
  # 10MS
}

variable "latency_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "latency_severity" {
  type    = string
  default = "critical"
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