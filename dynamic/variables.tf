variable "ami_id" {
  type        = string
  description = "AMI ID"
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type        = string
  description = "Instance type of the EC2 instance"
  default     = "t3.micro"
}

variable "sg_name" {
  type    = string
  default = "allow-all-terraform"
}

variable "sg_from_port" {
  type    = number
  default = 0
}

variable "sg_to_port" {
  type    = number
  default = 0
}

variable "sg_cider_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(string)
  default = {
    Name        = "terraform"
    Project     = "roboshop"
    Terrrform   = "true"
    Environment = "dev"
  }
}

variable "ingress_rules" {
  default = [
    {
      port        = 22
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allowing port number 22 from internet"
    },
    {
      port        = 443
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allowing port number 443 from internet"
    },
    {
      port        = 3306
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allowing port number 3306 from internet"
    }
  ]
}