# variables.tf
variable "github_repository_url" {
  description = "URL of the GitHub repository"
  type        = string
}

variable "github_secret_name" {
  description = "Name of the GitHub token secret in AWS Secrets Manager"
  type        = string
}
