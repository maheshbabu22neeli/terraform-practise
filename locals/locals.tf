locals {
  instance_name = "${var.domain-name}-${var.environment}"
  ami_id           = data.aws_ami.redhat.id
  instance_type = "t3.micro"

  common-tags =  {
      Name = local.instance_name
      Project = "Roboshop"
      Environment = "dev"
      Terraform = "true"
  }

  ec2-final-tags = merge(local.common-tags, var.ec2-tags)
  sg-final-tags = merge(local.common-tags, var.sg-tags)
}