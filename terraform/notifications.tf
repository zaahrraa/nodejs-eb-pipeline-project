resource "aws_sns_topic" "pipeline_notifications" {
  name = "${var.app_name}-pipeline-notifications"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.pipeline_notifications.arn
  protocol  = "email"
  endpoint  = "YOUR-EMAIL@example.com"   # <-- Replace with your real email
}

resource "aws_codestarnotifications_notification_rule" "pipeline_notify" {
  name        = "${var.app_name}-pipeline-events"
  detail_type = "BASIC"
  resource    = aws_codepipeline.pipeline.arn
  event_type_ids = [
    "codepipeline-pipeline-pipeline-execution-failed",
    "codepipeline-pipeline-pipeline-execution-succeeded"
  ]
  target {
    address = aws_sns_topic.pipeline_notifications.arn
  }
}