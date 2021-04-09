locals {
  latency_filter = coalesce(
    var.latency_filter_override,
    var.filter_str
  )
}

module "redis_latency" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Latency"
  query = "avg(${var.latency_evaluation_period}):avg:redis.info.latency_ms{${local.latency_filter}} >= ${var.latency_critical}"

  enabled          = var.latency_enabled
  alerting_enabled = var.latency_alerting_enabled

  alert_message    = "Latency on ${var.service} has dropped below {{threshold}} and has {{value}} available"
  recovery_message = "Latency on ${var.service} has recovered {{value}}"

  service         = var.service
  env             = var.alert_env
  severity        = var.latency_severity
  note            = var.latency_note
  docs            = var.latency_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked = var.locked

  critical_threshold = var.latency_critical
  warning_threshold  = var.latency_warning
}
