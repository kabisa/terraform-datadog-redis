variable "memory_fragmentation_enabled" {
  type        = bool
  default     = true
  description = "Memory fragmentation in redis"
}

variable "memory_fragmentation_warning" {
  type    = number
  default = 1.1
  # More then 1 single memory block is already a sign of trouble
}

variable "memory_fragmentation_critical" {
  type    = number
  default = 1.5
  # Memory fragmentation above 1.5 means trouble
}

variable "memory_fragmentation_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memory_fragmentation_severity" {
  type    = string
  default = "critical"
}

variable "memory_fragmentation_note" {
  type    = string
  default = ""
}

variable "memory_fragmentation_docs" {
  type    = string
  default = ""
}

variable "memory_fragmentation_filter_override" {
  type    = string
  default = ""
}

variable "memory_fragmentation_alerting_enabled" {
  type    = bool
  default = true
}

variable "memory_fragmentation_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}