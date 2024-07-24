resource "aws_instance" "target" {
  ami = "ami-056f95ba99f81dbab"
  key_name = "dynamodb"
  instance_type = "t3.micro"
}
resource "aws_s3_bucket" "target" {
    bucket = "jsbdndkhnvks"
  
}