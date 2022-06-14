locals {
  memory_free_bytes_filter = coalesce(
    var.memory_free_bytes_filter_override,
    var.filter_str
  )
}

module "memory_free_bytes" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name             = "Available Memory"
  query            = "avg(${var.memory_free_bytes_evaluation_period}):avg:redis.mem.maxmemory{${local.memory_free_bytes_filter}} - avg:redis.mem.used{${local.memory_free_bytes_filter}} < ${var.memory_free_bytes_critical}"
  alert_message    = "Available memory on ${var.service} has dropped below {{threshold}} and has {{value}} available"
  recovery_message = "Available memory on ${var.service} has recovered {{value}}"

  # monitor level vars
  enabled            = var.memory_free_bytes_enabled
  alerting_enabled   = var.memory_free_bytes_alerting_enabled
  critical_threshold = var.memory_free_bytes_critical
  warning_threshold  = var.memory_free_bytes_warning
  priority           = var.memory_free_bytes_priority
  severity           = var.memory_free_bytes_severity
  docs               = var.memory_free_bytes_docs
  note               = var.memory_free_bytes_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}
