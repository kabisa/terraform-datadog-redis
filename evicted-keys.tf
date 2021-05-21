locals {
  evicted_keys_filter = coalesce(
    var.evicted_keys_filter_override,
    var.filter_str
  )
}

module "evicted_keys" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name             = "Evicted Keys"
  query            = "avg(${var.evicted_keys_evaluation_period}):avg:redis.keys.evicted{${local.evicted_keys_filter}} >= ${var.evicted_keys_critical}"
  alert_message    = "Memory usage on ${var.service} has gone so high, it needs to start evicting keys. Current threshold: {{threshold}} and is eviction rate: {{value}}"
  recovery_message = "${var.service} is evicting keys at the rate of  {{value}}"

  # monitor level vars
  enabled            = var.evicted_keys_enabled
  alerting_enabled   = var.evicted_keys_alerting_enabled
  critical_threshold = var.evicted_keys_critical
  warning_threshold  = var.evicted_keys_warning
  priority           = var.evicted_keys_priority
  severity           = var.evicted_keys_severity
  note               = var.evicted_keys_note
  docs               = var.evicted_keys_docs

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}
