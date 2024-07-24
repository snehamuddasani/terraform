resource "aws_instance" "xyz" {
  instance_type = "t3.micro"
  ami="ami-056f95ba99f81dbab"
  associate_public_ip_address = true
  count=length(var.sandbox)
  tags = {
    Name=var.sandbox[count.index]
  }
}