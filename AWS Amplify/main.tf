# main.tf
provider "aws" {
  region = "us-east-1"  # Change to your preferred AWS region
}

module "amplify_app" {
  source = "./amplify"
}

output "amplify_app_url" {
  value = module.amplify_app.amplify_app_url
}
