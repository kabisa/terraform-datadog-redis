locals {
  latency_filter = coalesce(
    var.latency_filter_override,
    var.filter_str
  )
}

module "latency" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name             = "Latency"
  query            = "avg(${var.latency_evaluation_period}):avg:redis.info.latency_ms{${local.latency_filter}} >= ${var.latency_critical}"
  alert_message    = "Latency on ${var.service} has dropped below {{threshold}} and has {{value}} available"
  recovery_message = "Latency on ${var.service} has recovered {{value}}"

  # monitor level vars
  enabled            = var.latency_enabled
  alerting_enabled   = var.latency_alerting_enabled
  critical_threshold = var.latency_critical
  warning_threshold  = var.latency_warning
  priority           = var.latency_priority
  severity           = var.latency_severity
  docs               = var.latency_docs
  note               = var.latency_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}
