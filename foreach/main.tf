resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.ec
  associate_public_ip_address = true
  for_each = toset(var.sandbox)

  tags = {
    Name=each.value
  }
}