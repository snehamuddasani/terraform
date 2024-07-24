resource "aws_instance" "import" {
  ami="ami-056f95ba99f81dbab"
  instance_type = "t3.micro"
  key_name = "dynamodb"
  tags = {
    Name="day-1"
  }
}