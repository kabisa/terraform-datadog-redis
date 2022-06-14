variable "hitratio_enabled" {
  type        = bool
  default     = true
  description = "hitratio in redis"
}

variable "hitratio_warning" {
  type    = number
  default = 50
  # 50 percent
}

variable "hitratio_critical" {
  type    = number
  default = 40
  # 40 percent
}

variable "hitratio_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "hitratio_severity" {
  type    = string
  default = "critical"
}

variable "hitratio_note" {
  type    = string
  default = ""
}

variable "hitratio_docs" {
  type    = string
  default = ""
}

variable "hitratio_filter_override" {
  type    = string
  default = ""
}

variable "hitratio_alerting_enabled" {
  type    = bool
  default = true
}

variable "hitratio_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}
