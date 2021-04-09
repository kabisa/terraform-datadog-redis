variable "memfrag_enabled" {
  type    = bool
  default = true
  description = "memfrag in redis"
}

variable "memfrag_warning" {
  type    = number
  default = 1.1
  # more then 1 signle memory block is already a sign of trouble 
}

variable "memfrag_critical" {
  type    = number
  default = 1.5
  # Memory fragmentation above 1.5 means trouble
}

variable "memfrag_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memfrag_severity" {
  type    = string
  default = "critical"
}

variable "memfrag_note" {
  type    = string
  default = ""
}

variable "memfrag_docs" {
  type    = string
  default = ""
}

variable "memfrag_filter_override" {
  type    = string
  default = ""
}

variable "memfrag_alerting_enabled" {
  type    = bool
  default = true
}