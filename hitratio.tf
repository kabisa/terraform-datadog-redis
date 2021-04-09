locals {
  hitratio_filter = coalesce(
    var.hitratio_filter_override,
    var.filter_str
  )
}

module "redis_hitratio" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Hitratio"
  query = "avg(${var.hitratio_evaluation_period}):( avg:redis.stats.keyspace_hits{${local.hitratio_filter}} / ( avg:redis.stats.keyspace_hits{${local.hitratio_filter}} + avg:redis.stats.keyspace_misses{${local.hitratio_filter}} ) ) * 100 <= ${var.hitratio_critical}"

  enabled          = var.hitratio_enabled
  alerting_enabled = var.hitratio_alerting_enabled


  alert_message    = "Hit Ratio on ${var.service} has dropped below {{threshold}}% and is {{value}}%."
  recovery_message = "Hit Ratio on ${var.service} has recovered to {{value}}%"

  service         = var.service
  env             = var.alert_env
  severity        = var.hitratio_severity
  note            = var.hitratio_note
  docs            = var.hitratio_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked = var.locked

  critical_threshold = var.hitratio_critical
  warning_threshold  = var.hitratio_warning
}
