# outputs.tf
output "amplify_app_url" {
  value = aws_amplify_app.my_nextjs_app.default_domain
}
