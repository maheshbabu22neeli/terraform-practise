locals {
  ami_id = data.aws_ami.redhat.id
  env = terraform.workspace
}