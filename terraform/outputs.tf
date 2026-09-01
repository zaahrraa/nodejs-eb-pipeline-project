output "elastic_beanstalk_url" {
  description = "URL of your deployed application"
  value       = aws_elastic_beanstalk_environment.env.cname
}

output "pipeline_name" {
  value = aws_codepipeline.pipeline.name
}