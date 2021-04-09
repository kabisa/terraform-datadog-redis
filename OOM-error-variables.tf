variable "oom_error_enabled" {
  type    = bool
  default = true
  description = "oom_error in redis"
}

variable "oom_error_warning" {
  type    = number
  default = 1
  # 1 oom_errors
}

variable "oom_error_critical" {
  type    = number
  default = 5
  # 5 oom_errors
}

variable "oom_error_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "oom_error_severity" {
  type    = string
  default = "critical"
}

variable "oom_error_note" {
  type    = string
  default = ""
}

variable "oom_error_docs" {
  type    = string
  default = ""
}

variable "oom_error_filter_override" {
  type    = string
  default = ""
}

variable "oom_error_alerting_enabled" {
  type    = bool
  default = true
}

variable "type" {
  type = string
  default = "log alert"
}