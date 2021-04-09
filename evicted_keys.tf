locals {
  eviction_filter = coalesce(
    var.eviction_filter_override,
    var.filter_str
  )
}

module "redis_eviction" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Eviction Rate"
  query = "avg(${var.eviction_evaluation_period}):avg:redis.keys.evicted{${local.eviction_filter}} >= ${var.eviction_critical}"

  enabled          = var.eviction_enabled
  alerting_enabled = var.eviction_alerting_enabled

  alert_message    = "Memory usage on ${var.service} has gone so high, it needs to start evicting keys. Current threshold: {{threshold}} and is eviction rate: {{value}}"
  recovery_message = "${var.service} is evicting keys at the rate of  {{value}}"

  service         = var.service
  env             = var.alert_env
  severity        = var.eviction_severity
  note            = var.eviction_note
  docs            = var.eviction_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked = var.locked

  critical_threshold = var.eviction_critical
  warning_threshold  = var.eviction_warning
}
