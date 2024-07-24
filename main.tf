resource "aws_instance" "name" {
    ami="ami-01376101673c89611"
    instance_type = "t3.micro"
    key_name = "publickey"

}