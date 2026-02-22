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