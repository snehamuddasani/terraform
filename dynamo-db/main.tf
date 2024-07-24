resource "aws_instance" "dev1" {
    ami = "ami-056f95ba99f81dbab"
    instance_type = "t3.micro"
    key_name = "publickey"
  tags={
    Name="dev"
  }
}
resource "aws_instance" "web" {
  ami                    = "ami-056f95ba99f81dbab"      #change ami id for different region
  instance_type          = "t3.micro"
  key_name               = "publickey"              #change key name as per your setup
 
  tags = {
    Name = "ec"
  }

  root_block_device {         #we can give custom value here 
    volume_size = 40
  }
}

resource "aws_security_group" "xyz" {
  name        = "xyz"
  description = "Allow TLS inbound traffic"

  ingress = [
    for port in [22, 80, 443, 8080] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "xyz"
  }
}