variable "connected_clients_enabled" {
  type        = bool
  default     = true
  description = "connected_clients in redis"
}

variable "connected_clients_warning" {
  type    = number
  default = 600
  # 600 connected_clientss
}

variable "connected_clients_critical" {
  type    = number
  default = 800
  # 800 connected_clientss
}

variable "connected_clients_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "connected_clients_severity" {
  type    = string
  default = "critical"
}

variable "connected_clients_note" {
  type    = string
  default = ""
}

variable "connected_clients_docs" {
  type    = string
  default = ""
}

variable "connected_clients_filter_override" {
  type    = string
  default = ""
}

variable "connected_clients_alerting_enabled" {
  type    = bool
  default = true
}