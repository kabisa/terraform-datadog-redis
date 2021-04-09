locals {
  maxmem_filter = coalesce(
    var.maxmem_filter_override,
    var.filter_str
  )
}

module "redis_maxmem" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Memory Usage"
  query = "avg(${var.maxmem_evaluation_period}):( avg:redis.mem.used{${local.maxmem_filter}} / avg:redis.mem.maxmemory{${local.maxmem_filter}} ) * 100 >= ${var.maxmem_critical}"

  enabled          = var.maxmem_enabled
  alerting_enabled = var.maxmem_alerting_enabled


  alert_message    = "Memory usage on ${var.service} has gone above {{threshold}}% and is currently {{value}}%."
  recovery_message = "Memory usage on ${var.service} has recovered to {{value}}%"

  service         = var.service
  env             = var.alert_env
  severity        = var.maxmem_severity
  note            = var.maxmem_note
  docs            = var.maxmem_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked = var.locked

  critical_threshold = var.maxmem_critical
  warning_threshold  = var.maxmem_warning
}
