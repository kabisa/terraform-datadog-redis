locals {
  memory_fragmentation_filter = coalesce(
    var.memory_fragmentation_filter_override,
    var.filter_str
  )
}

module "memory_fragmentation" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name             = "Memory Fragmentation"
  query            = "avg(${var.memory_fragmentation_evaluation_period}):avg:redis.mem.fragmentation_ratio{${local.memory_fragmentation_filter}} > ${var.memory_fragmentation_critical}"
  alert_message    = "Memory Fragmentation problem on ${var.service}. Meaning the OS cannot supply ${var.service} with 'single blocks' of memory. So it has to fragment ${var.service}'s memory in order to still fit.  The threshold for this alert is {{threshold}} and the fragmentation is currently {{value}}."
  recovery_message = "Memory Fragmentation on ${var.service} has recovered to {{value}} single block of memory."

  # monitor level vars
  enabled            = var.memory_fragmentation_enabled
  alerting_enabled   = var.memory_fragmentation_alerting_enabled
  critical_threshold = var.memory_fragmentation_critical
  warning_threshold  = var.memory_fragmentation_warning
  priority           = var.memory_fragmentation_priority
  severity           = var.memory_fragmentation_severity
  docs               = var.memory_fragmentation_docs
  note               = var.memory_fragmentation_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
}
