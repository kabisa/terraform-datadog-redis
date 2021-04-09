locals {
  evicted_keys_filter = coalesce(
    var.evicted_keys_filter_override,
    var.filter_str
  )
}

module "evicted_keys" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Evicted Keys"
  query = "avg(${var.evicted_keys_evaluation_period}):avg:redis.keys.evicted{${local.evicted_keys_filter}} >= ${var.evicted_keys_critical}"

  enabled          = var.evicted_keys_enabled
  alerting_enabled = var.evicted_keys_alerting_enabled

  alert_message    = "Memory usage on ${var.service} has gone so high, it needs to start evicting keys. Current threshold: {{threshold}} and is eviction rate: {{value}}"
  recovery_message = "${var.service} is evicting keys at the rate of  {{value}}"

  service         = var.service
  env             = var.alert_env
  severity        = var.evicted_keys_severity
  note            = var.evicted_keys_note
  docs            = var.evicted_keys_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = var.evicted_keys_critical
  warning_threshold  = var.evicted_keys_warning
}
