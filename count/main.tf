resource "aws_instance" "xyz" {
  instance_type = "t3.micro"
  key_name = "publickey"
  ami = "ami-056f95ba99f81dbab"
  count =6
  tags = {
    Name="xyz"
  }
}