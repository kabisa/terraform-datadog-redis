# locals {
#   opspersec_filter = coalesce(
#     var.opspersec_filter_override,
#     var.filter_str
#   )
# }

# module "redis_opspersec" {
#   source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

#   name  = "Operations per Second"
#   query = "avg(${var.opspersec_evaluation_period}):anomalies(avg:redis.net.instantaneous_ops_per_sec{${local.opspersec_filter}}, 'basic', 2, direction='both', alert_window='${var.opspersec_evaluation_period}', interval=21600, count_default_zero='true') >= ${var.opspersec_critical}"


#   enabled          = var.opspersec_enabled
#   alerting_enabled = var.opspersec_alerting_enabled

#   alert_message    = "Operations per second on ${var.service} has an anomaly {{value}}"
#   recovery_message = "Operations per second on ${var.service} has recovered {{value}}"

#   service         = var.service
#   env             = var.alert_env
#   severity        = var.opspersec_severity
#   note            = var.opspersec_note
#   docs            = var.opspersec_docs
#   additional_tags = var.additional_tags

#   notification_channel = var.notification_channel

#   require_full_window = true
#   locked = var.locked

#   critical_threshold = var.opspersec_critical
#   warning_threshold  = var.opspersec_warning
# }


## Export of this check:
# {
# 	"id": 846280,
# 	"name": "Redis - Operations per second",
# 	"type": "query alert",
# 	"query": "avg(last_2w):anomalies(avg:redis.net.instantaneous_ops_per_sec{aiven-project:kabisa-d466}, 'basic', 2, direction='both', alert_window='last_14d', interval=21600, count_default_zero='true') >= 1",
# 	"message": "{{#is_alert}}\nOperations per second on Redis has an anomaly {{value}}\n{{/is_alert}}\n{{#is_recovery}}\nOperations per second on Redis has recovered {{value}}\n{{/is_recovery}}\n@pagerduty-VacanSoleil",
# 	"tags": [
# 		"env:prd",
# 		"service:Redis",
# 		"severity:critical"
# 	],
# 	"options": {
# 		"notify_audit": false,
# 		"locked": true,
# 		"timeout_h": 0,
# 		"silenced": {},
# 		"include_tags": true,
# 		"no_data_timeframe": null,
# 		"require_full_window": true,
# 		"new_host_delay": 300,
# 		"notify_no_data": false,
# 		"renotify_interval": 0,
# 		"escalation_message": "",
# 		"threshold_windows": {
# 			"recovery_window": "last_5m",
# 			"trigger_window": "last_14d"
# 		},
# 		"thresholds": {
# 			"critical": 1,
# 			"critical_recovery": 0
# 		}
# 	},
# 	"priority": null
# }