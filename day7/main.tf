resource "aws_instance" "dependent" {
  ami = "ami-056f95ba99f81dbab"
   key_name = "dynamodb"
   instance_type = "t3.micro"
}
resource "aws_s3_bucket" "dependency" {
    bucket = "suhbdfkhsuekg"
    depends_on = [ aws_instance.dependent]
}