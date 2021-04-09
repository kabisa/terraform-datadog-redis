locals {
  memfrag_filter = coalesce(
    var.memfrag_filter_override,
    var.filter_str
  )
}

module "redis_memfrag" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Memory Fragmentation"
  query = "avg(${var.memfrag_evaluation_period}):avg:redis.mem.fragmentation_ratio{${local.memfrag_filter}} > ${var.memfrag_critical}"

  enabled          = var.memfrag_enabled
  alerting_enabled = var.memfrag_alerting_enabled

  
  alert_message    = "Memory Fragmentation problem on ${var.service}. Meaning the OS cannot supply ${var.service} with 'single blocks' of memory. So it has to fragment ${var.service}'s memory in order to still fit.  The threshold for this alert is {{threshold}} and the fragmentation is currently {{value}}."
  recovery_message = "Memory Fragmentation on ${var.service} has recovered to {{value}} single block of memory."
  

  service         = var.service
  env             = var.alert_env
  severity        = var.memfrag_severity
  note            = var.memfrag_note
  docs            = var.memfrag_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked = var.locked

  critical_threshold = var.memfrag_critical
  warning_threshold  = var.memfrag_warning
}
