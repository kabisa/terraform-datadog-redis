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

variable "memory_free_bytes_note" {
  type    = string
  default = ""
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
  default = 2
}
