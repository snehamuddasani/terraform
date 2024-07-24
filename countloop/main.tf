#example1:without list varaible 
 resource "aws_instance" "myec2" {
     ami = "ami-056f95ba99f81dbab"
     instance_type = "t3.micro"
     associate_public_ip_address = true
     count = 2
     tags = {
   #   Name = "webec2"
      Name = "webec2-${count.index}"
     }
 }