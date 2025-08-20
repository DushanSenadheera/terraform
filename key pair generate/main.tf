provider "aws" {
  region = "us-east-1"
}

# Generate a new RSA private key
resource "tls_private_key" "devops_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair
resource "aws_key_pair" "devops_kp" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops_key.public_key_openssh
}

# Save private key to file
resource "local_file" "private_key" {
  content  = tls_private_key.devops_key.private_key_pem
  filename = "/home/bob/devops-kp.pem"
}
