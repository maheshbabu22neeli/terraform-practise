# Create the EC2 instance
resource "aws_instance" "aws_ec2_i" {
  ami           = local.ami_id
  instance_type = local.instance_type

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.aws_instance_sg.id]

  # Optional: Add tags to the instance
  tags = local.ec2-final-tags
}

resource "aws_security_group" "aws_instance_sg" {

  name        = "allow-all-terraform"
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

  # functions cannot be applied at resource level
  # tags = merge(local.common-tags, var.sg-tags)
  tags = local.sg-final-tags
}