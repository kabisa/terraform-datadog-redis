variable "memory_used_percentage_enabled" {
  type        = bool
  default     = true
  description = "maxmem in redis"
}

variable "memory_used_percentage_warning" {
  type    = number
  default = 80
  # 80 percent
}

variable "memory_used_percentage_critical" {
  type    = number
  default = 95
  # 95 percent
}

variable "memory_used_percentage_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memory_used_percentage_severity" {
  type    = string
  default = "critical"
}

variable "memory_used_percentage_note" {
  type    = string
  default = ""
}

variable "memory_used_percentage_docs" {
  type    = string
  default = ""
}

variable "memory_used_percentage_filter_override" {
  type    = string
  default = ""
}

variable "memory_used_percentage_alerting_enabled" {
  type    = bool
  default = true
}