variable "maxmem_enabled" {
  type    = bool
  default = true
  description = "maxmem in redis"
}

variable "maxmem_warning" {
  type    = number
  default = 80
  # 80 percent
}

variable "maxmem_critical" {
  type    = number
  default = 95
  # 95 percent
}

variable "maxmem_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "maxmem_severity" {
  type    = string
  default = "critical"
}

variable "maxmem_note" {
  type    = string
  default = ""
}

variable "maxmem_docs" {
  type    = string
  default = ""
}

variable "maxmem_filter_override" {
  type    = string
  default = ""
}

variable "maxmem_alerting_enabled" {
  type    = bool
  default = true
}