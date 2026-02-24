variable "domain-name" {
  type = string
  default = "local-domain"
}

variable "environment" {
  type = string
  default = "dev"
}

/*variable "instance-name" {
  type = string
  default = "${var.domain-name}-${var.environment}"
}*/



variable "ec2-tags" {
  default = {
    Name = "locals-ec2-tags"
  }
}

variable "sg-tags" {
  default = {
    Name = "locals-sg-tags"
  }
}

