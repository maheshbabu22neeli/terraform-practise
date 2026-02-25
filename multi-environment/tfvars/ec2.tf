# Create the EC2 instance
resource "aws_instance" "roboshop" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = var.instance_type

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.aws_instance_sg.id]

  # Optional: Add tags to the instance
  tags = {
    Name    = "terraform-${var.environment}"
    Project = "roboshop"
    Environment = var.environment
  }
}

resource "aws_security_group" "aws_instance_sg" {

  name        = "allow-all-terraform-${var.environment}"
  description = "Allow TLS inbound and outbound traffic for all"

  // outbound
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  // inbound
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all-terraform-${var.environment}"
  }
}