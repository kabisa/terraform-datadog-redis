locals {
  memory_used_percentage_filter = coalesce(
    var.memory_used_percentage_filter_override,
    var.filter_str
  )
}

module "memory_used_percentage" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name             = "Memory Usage"
  query            = "avg(${var.memory_used_percentage_evaluation_period}):( avg:redis.mem.used{${local.memory_used_percentage_filter}} / avg:redis.mem.maxmemory{${local.memory_used_percentage_filter}} ) * 100 >= ${var.memory_used_percentage_critical}"
  alert_message    = "Memory usage on ${var.service} has gone above {{threshold}}% and is currently {{value}}%."
  recovery_message = "Memory usage on ${var.service} has recovered to {{value}}%"

  # monitor level vars
  enabled            = var.memory_used_percentage_enabled
  alerting_enabled   = var.memory_used_percentage_alerting_enabled
  critical_threshold = var.memory_used_percentage_critical
  warning_threshold  = var.memory_used_percentage_warning
  priority           = var.memory_used_percentage_priority
  severity           = var.memory_used_percentage_severity
  docs               = var.memory_used_percentage_docs
  note               = var.memory_used_percentage_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}
