# Create the EC2 instance
resource "aws_instance" "roboshop" {

  count = 10

  ami           = var.ami_id
  instance_type = var.instance_type

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.aws_instance_sg.id]

  # Optional: Add tags to the instance
  tags = {
    Name    = var.instances[count.index]
    Project = "roboshop"
  }
}

resource "aws_security_group" "aws_instance_sg" {

  name        = var.sg_name
  description = "Allow TLS inbound and outbound traffic for all"

  // outbound
  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_cider_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  // inbound
  ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_cider_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}