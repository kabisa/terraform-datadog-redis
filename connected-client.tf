locals {
  connected_clients_filter = coalesce(
    var.connected_clients_filter_override,
    var.filter_str
  )
}

module "connected_clients" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name             = "Connected Clients"
  query            = "avg(${var.connected_clients_evaluation_period}):avg:redis.net.clients{${local.connected_clients_filter}} >= ${var.connected_clients_critical}"
  alert_message    = "Amount of connected clients to ${var.service} has gone above {{threshold}} and is currently {{value}}%. This could indicate problems with upstream not responding quickly enough."
  recovery_message = "Amount of connected clients to ${var.service} has recovered to {{value}}"

  # monitor level vars
  enabled            = var.connected_clients_enabled
  alerting_enabled   = var.connected_clients_alerting_enabled
  critical_threshold = var.connected_clients_critical
  warning_threshold  = var.connected_clients_warning
  priority           = var.connected_clients_priority
  severity           = var.connected_clients_severity
  docs               = var.connected_clients_docs
  note               = var.connected_clients_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}
