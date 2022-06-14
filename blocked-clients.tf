locals {
  blocked_clients_filter = coalesce(
    var.blocked_clients_filter_override,
    var.filter_str
  )
}

module "blocked_clients_clients" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name             = "Blocked Clients"
  query            = "avg(${var.blocked_clients_evaluation_period}):avg:redis.clients.blocked{${local.blocked_clients_filter}} >= ${var.blocked_clients_critical}"
  alert_message    = "${var.service} is waiting to fill a request with data. Until the data is filled, the client is blocked. Current threshold: {{threshold}} and is currently at {{value}} blocked clients. This could indicate a latency issue or timeouts upstream."
  recovery_message = "${var.service} blocked clients is back to {{value}}"

  # monitor level vars
  enabled            = var.blocked_clients_enabled
  alerting_enabled   = var.blocked_clients_alerting_enabled
  critical_threshold = var.blocked_clients_critical
  warning_threshold  = var.blocked_clients_warning
  priority           = var.blocked_clients_priority
  docs               = var.blocked_clients_docs
  note               = var.blocked_clients_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}
