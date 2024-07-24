resource "aws_instance" "dev" {
    ami="ami-06d753822bd94c64e"
    instance_type = "t2.micro"
    key_name = "abcdefgh"
    vpc_security_group_ids = [ aws_security_group.dev.id ]
    subnet_id= aws_subnet.dev.id
    associate_public_ip_address = true
    tags={
        Name="dev_instance"
    }
  
}
resource "aws_instance" "dev2" {
    ami="ami-06d753822bd94c64e"
    instance_type = "t2.micro"
    key_name = "abcdefgh"
    subnet_id=aws_subnet.dev2.id
    vpc_security_group_ids = [ aws_security_group.dev2.id ]
    tags={
        Name="dev2_instance"
    }
  
}