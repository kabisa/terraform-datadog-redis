locals {
  blocked_clients_filter = coalesce(
    var.blocked_clients_filter_override,
    var.filter_str
  )
}

module "blocked_clients_clients" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Blocked Clients"
  query = "avg(${var.blocked_clients_evaluation_period}):avg:redis.clients.blocked{${local.blocked_clients_filter}} >= ${var.blocked_clients_critical}"

  enabled          = var.blocked_clients_enabled
  alerting_enabled = var.blocked_clients_alerting_enabled

  alert_message    = "${var.service} is waiting to fill a request with data. Until the data is filled, the client is blocked. Current threshold: {{threshold}} and is currently at {{value}} blocked clients. This could indicate a latency issue or timeouts upstream."
  recovery_message = "${var.service} blocked clients is back to {{value}}"

  service         = var.service
  env             = var.alert_env
  severity        = var.blocked_clients_severity
  note            = var.blocked_clients_note
  docs            = var.blocked_clients_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = var.blocked_clients_critical
  warning_threshold  = var.blocked_clients_warning
}
