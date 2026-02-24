# Create the EC2 instance
resource "aws_instance" "roboshop" {
  ami           = data.aws_ami.redhat.id
  instance_type = "t3.micro" # A free-tier eligible instance type

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.aws_instance_sg.id]

  # Optional: Add tags to the instance
  tags = {
    Name    = "terraform"
    Project = "roboshop"
  }
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

  tags = {
    Name = "allow-all-terraform"
  }
}