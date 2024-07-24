resource "aws_instance" "name" {
    ami = "ami-056f95ba99f81dbab"
    instance_type = "t3.micro"
    key_name = "publickey"
    vpc_security_group_ids = [ aws_security_group.name.id ]
    associate_public_ip_address = true
    subnet_id = aws_subnet.name.id
    user_data = file("script.sh")
    tags = {
      Name="xyz"
    }
}
resource "aws_vpc" "name" {
cidr_block = "10.0.0.0/16"
  tags = {
    Name="puclic"
  }
}
resource "aws_subnet" "name" {
  vpc_id = aws_vpc.name.id
   cidr_block = "10.0.0.0/24"
   tags = {
     Name="public"
   }
}
resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name="public"
  }
}
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name="public"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id 
 }
}
resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.name.id
  route_table_id = aws_route_table.name.id
}
resource "aws_security_group" "name" {
  vpc_id = aws_vpc.name.id
  name = "sg"
  description = "allow access"
  tags = {

  Name="public"
  }
  ingress {
    description = "tls from vpc"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [ "0.0.0.0/0" ]
  }
}