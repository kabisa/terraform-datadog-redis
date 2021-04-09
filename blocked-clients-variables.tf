variable "blocked_enabled" {
  type    = bool
  default = true
  description = "blocked in redis"
}

variable "blocked_warning" {
  type    = number
  default = 5
  # 5 blocked clients
}

variable "blocked_critical" {
  type    = number
  default = 10
  # 10 blocked clients
}

variable "blocked_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "blocked_severity" {
  type    = string
  default = "critical"
}

variable "blocked_note" {
  type    = string
  default = ""
}

variable "blocked_docs" {
  type    = string
  default = ""
}

variable "blocked_filter_override" {
  type    = string
  default = ""
}

variable "blocked_alerting_enabled" {
  type    = bool
  default = true
}
