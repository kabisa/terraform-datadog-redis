locals {
  connected_clients_filter = coalesce(
    var.connected_clients_filter_override,
    var.filter_str
  )
}

module "redis_connected_clients" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Connected Clients"
  query = "avg(${var.connected_clients_evaluation_period}):avg:redis.net.clients{${local.connected_clients_filter}} >= ${var.connected_clients_critical}"

  enabled          = var.connected_clients_enabled
  alerting_enabled = var.connected_clients_alerting_enabled

  alert_message    = "Amount of connected clients to ${var.service} has gone above {{threshold}} and is currently {{value}}%. This could indicate problems with upstream not responding quickly enough."
  recovery_message = "Amount of connected clients to ${var.service} has recovered to {{value}}"

  service         = var.service
  env             = var.alert_env
  severity        = var.connected_clients_severity
  note            = var.connected_clients_note
  docs            = var.connected_clients_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked = var.locked

  critical_threshold = var.connected_clients_critical
  warning_threshold  = var.connected_clients_warning
}
