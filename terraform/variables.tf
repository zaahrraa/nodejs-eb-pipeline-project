variable "aws_region" {
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "app_name" {
  description = "Name of the application"
  default     = "nodejs-eb-app"
}

variable "github_connection_arn" {
  description = "ARN of the CodeStar connection to GitHub"
  type        = string
}

variable "github_repo_id" {
  description = "GitHub repo in the form username/repo-name"
  type        = string
}

variable "github_branch" {
  description = "Branch to watch for changes"
  default     = "main"
}