output "out_ami_id" {
  value = data.aws_ami.redhat.id
}

output "out_instance_info" {
  value = aws_instance.roboshop
}