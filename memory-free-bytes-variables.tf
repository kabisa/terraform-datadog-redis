variable "memory_available_enabled" {
  type    = bool
  default = true
  description = "Memory free in redis"
}

variable "memory_available_warning" {
  type    = number
  default = 1000000000
  # 1GB
}

variable "memory_available_critical" {
  type    = number
  default = 500000000
  # 500MB
}

variable "memory_available_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memory_available_severity" {
  type    = string
  default = "critical"
}

variable "memory_available_note" {
  type    = string
  default = ""
}

variable "memory_available_docs" {
  type    = string
  default = ""
}

variable "memory_available_filter_override" {
  type    = string
  default = ""
}

variable "memory_available_alerting_enabled" {
  type    = bool
  default = true
}