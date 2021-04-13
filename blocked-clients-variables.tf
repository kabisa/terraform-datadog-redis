variable "blocked_clients_enabled" {
  type        = bool
  default     = true
  description = "blocked in redis"
}

variable "blocked_clients_warning" {
  type    = number
  default = 5
  # 5 blocked clients
}

variable "blocked_clients_critical" {
  type    = number
  default = 10
  # 10 blocked clients
}

variable "blocked_clients_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "blocked_clients_severity" {
  type    = string
  default = "critical"
}

variable "blocked_clients_note" {
  type    = string
  default = ""
}

variable "blocked_clients_docs" {
  type    = string
  default = ""
}

variable "blocked_clients_filter_override" {
  type    = string
  default = ""
}

variable "blocked_clients_alerting_enabled" {
  type    = bool
  default = true
}
