locals {
  hitratio_filter = coalesce(
    var.hitratio_filter_override,
    var.filter_str
  )
}

module "hitratio" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name             = "Hitratio"
  query            = "avg(${var.hitratio_evaluation_period}):( avg:redis.stats.keyspace_hits{${local.hitratio_filter}} / ( avg:redis.stats.keyspace_hits{${local.hitratio_filter}} + avg:redis.stats.keyspace_misses{${local.hitratio_filter}} ) ) * 100 <= ${var.hitratio_critical}"
  alert_message    = "Hit Ratio on ${var.service} has dropped below {{threshold}}% and is {{value}}%."
  recovery_message = "Hit Ratio on ${var.service} has recovered to {{value}}%"

  # monitor level vars
  enabled            = var.hitratio_enabled
  alerting_enabled   = var.hitratio_alerting_enabled
  critical_threshold = var.hitratio_critical
  warning_threshold  = var.hitratio_warning
  priority           = var.hitratio_priority
  docs               = var.hitratio_docs
  note               = var.hitratio_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}
