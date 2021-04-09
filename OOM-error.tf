locals {
  oom_error_filter = coalesce(
    var.oom_error_filter_override,
    var.filter_str
  )
}

module "oom_error" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Out Of Memory errors in the logs"
  query = "logs(\"OOM command not allowed when used memory \\> 'maxmemory'.\").index(\"*\").rollup(\"count\").last(\"15m\") > ${var.oom_error_critical}"

  enabled          = var.oom_error_enabled
  alerting_enabled = var.oom_error_alerting_enabled

  alert_message    = <<EOF
Available memory on ${var.service} has dropped so much we are getting OOM errors in the logging.
See: https://app.datadoghq.eu/logs?query=OOM%20command%20not%20allowed%20when%20used%20memory%20%3E%20%27maxmemory%27.&index=%2A&integration_id=&integration_short_name=&saved_view=19730&from_ts=1617618461039&to_ts=1617704861039&live=true&cols=host%2Cservice&stream_sort=service%2Cdesc&messageDisplay=inline&viz=stream
    EOF
  recovery_message = "No more OOM error log entries in the last 15 minutes."

  service         = var.service
  env             = var.alert_env
  severity        = var.oom_error_severity
  note            = var.oom_error_note
  docs            = var.oom_error_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  type = var.type

  critical_threshold = var.oom_error_critical
  warning_threshold  = var.oom_error_warning
}
