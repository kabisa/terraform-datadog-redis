locals {
  cache_hitratio_filter = coalesce(
    var.cache_hitratio_filter_override,
    var.filter_str
  )
}

module "cache_hitratio" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name             = "Cache Hitratio"
  query            = "avg(${var.cache_hitratio_evaluation_period}):( avg:redis.stats.keyspace_hits{${local.cache_hitratio_filter}} / ( avg:redis.stats.keyspace_hits{${local.cache_hitratio_filter}} + avg:redis.stats.keyspace_misses{${local.cache_hitratio_filter}} ) ) * 100 <= ${var.cache_hitratio_critical}"
  alert_message    = "Cache Hit Ratio on ${var.service} has dropped below {{threshold}}% and is {{value}}%."
  recovery_message = "Cache Hit Ratio on ${var.service} has recovered to {{value}}%"

  # monitor level vars
  enabled            = var.cache_hitratio_enabled
  alerting_enabled   = var.cache_hitratio_alerting_enabled
  critical_threshold = var.cache_hitratio_critical
  warning_threshold  = var.cache_hitratio_warning
  priority           = var.cache_hitratio_priority
  severity           = var.cache_hitratio_severity
  docs               = var.cache_hitratio_docs
  note               = var.cache_hitratio_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}
