provider "aws" {
  
}

resource "aws_instance" "ec2" {
    ami = "ami-0427090fd1714168b"
    instance_type = "t2.micro"
    key_name = "north"
    tags = {
        Name = "cicd-ec2"
    }
  
}
