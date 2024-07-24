output "ec2_instance_ip" {
  value=aws_instance.dev.public_ip
  description = "print the value of the public ip"
}
output "ec2_instance_p" {
    value = aws_instance.dev2.private_ip
    description = "print the value of private ip"
    sensitive = false
}