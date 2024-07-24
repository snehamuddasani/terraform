resource "aws_instance" "test" {
  ami="ami-056f95ba99f81dbab"
  instance_type = "t3.micro"
  key_name = "dynamodb"
 // availability_zone ="ap-south-2"
  tags = {
    Name="jdsfh"
  }
/*ifecycle{
create_before_destroy=true
}
lifecycle{
prevent_destroy=true
}*/
lifecycle {
  ignore_changes = [ tags ]
}
}