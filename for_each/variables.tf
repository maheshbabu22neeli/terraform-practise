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

variable "ec2_tags" {

  type = map(string)
  default = {
    Name        = "terraform"
    Project     = "roboshop"
    Terrrform   = "true"
    Environment = "dev"
  }
}

// list
variable "instances" {
  type        = list(string)
  description = "Roboshop instances"
  default     = ["mongodb", "redis"]
}

// map
# variable "instances" {
#   type        = map(string)
#   description = "Roboshop Map instances"
#   default = {
#     mongodb : "t3.micro"
#     redis : "t3.small"
#     mysql : "t3.small"
#     rabbitmq : "t3.micro"
#   }
# }

variable "sg_name" {
  type    = string
  default = "allow-all-terraform-default"
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

variable "rout53_zone_id" {
  type    = string
  default = "Z013175831RO1NWFBESW7"
}

variable "rout53_domain_name" {
  type    = string
  default = "neeli.online"
}