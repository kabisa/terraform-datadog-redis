locals {
  memory_used_percentage_filter = coalesce(
    var.memory_used_percentage_filter_override,
    var.filter_str
  )
}

module "memory_used_percentage" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Memory Usage"
  query = "avg(${var.memory_used_percentage_evaluation_period}):( avg:redis.mem.used{${local.memory_used_percentage_filter}} / avg:redis.mem.maxmemory{${local.memory_used_percentage_filter}} ) * 100 >= ${var.memory_used_percentage_critical}"

  enabled          = var.memory_used_percentage_enabled
  alerting_enabled = var.memory_used_percentage_alerting_enabled


  alert_message    = "Memory usage on ${var.service} has gone above {{threshold}}% and is currently {{value}}%."
  recovery_message = "Memory usage on ${var.service} has recovered to {{value}}%"

  service         = var.service
  env             = var.alert_env
  severity        = var.memory_used_percentage_severity
  note            = var.memory_used_percentage_note
  docs            = var.memory_used_percentage_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = var.memory_used_percentage_critical
  warning_threshold  = var.memory_used_percentage_warning
}
