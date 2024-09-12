# amplify.tf
data "aws_secretsmanager_secret" "github_token" {
  name = var.github_secret_name
}

data "aws_secretsmanager_secret_version" "github_token_version" {
  secret_id = data.aws_secretsmanager_secret.github_token.id
}

resource "aws_amplify_app" "my_nextjs_app" {
  name        = "my-nextjs-app"
  repository  = var.github_repository_url

  iam_service_role_arn = aws_iam_role.amplify_role.arn

  environment_variables = {
    NODE_ENV = "production"
  }

  access_token = data.aws_secretsmanager_secret_version.github_token_version.secret_string
}

resource "aws_amplify_branch" "main_branch" {
  app_id        = aws_amplify_app.my_nextjs_app.app_id
  branch_name   = "main"  # Change if your branch name is different

  stage = "PRODUCTION"
}

output "amplify_app_url" {
  value = aws_amplify_app.my_nextjs_app.default_domain
}
