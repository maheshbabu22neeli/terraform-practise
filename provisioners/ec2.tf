# Create the EC2 instance
resource "aws_instance" "aws_ec2_i" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro" # A free-tier eligible instance type

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.aws_instance_sg.id]

  # here 'self' is terraform special variable
  provisioner "local-exec" {
    command = "echo private_ip:${self.private_ip}>> inventory.ini"
    // The argument "command", Each argument may be set only once.
    // command = "echo public_ip:${self.public_ip} >> inventory.ini"   -> error
  }

  provisioner "local-exec" {
    command = "echo public_ip:${self.public_ip}>> inventory.ini"
  }

  provisioner "local-exec" {
    command = "exit 1"
    on_failure = continue
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo 'Deleting the EC2 resources'"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo > inventory.ini"
  }

  # remote-exec
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx"
    ]
    when = destroy
  }

  # Optional: Add tags to the instance
  tags = {
    Name    = "terraform-provisioners"
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