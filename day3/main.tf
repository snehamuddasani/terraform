#create vpc and attach to ig
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"

 tags={
    Name="custom_vpc"
 } 
}
#create ig and attach to vpc
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
    tags= {
        Name="custom_ig"
    }
}
#create public subnet
resource "aws_subnet" "dev" {
  vpc_id = aws_vpc.dev.id
  cidr_block = "10.0.0.0/24"
  tags ={
    Name="custom_subnet_public"
  }
}
#create route table
resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id
  tags={
    Name="custom_route_Table"
  }
  route {
    cidr_block="0.0.0.0/0"
     gateway_id = aws_internet_gateway.dev.id
  }
}
#create route table associations
resource "aws_route_table_association" "dev"{
    subnet_id = aws_subnet.dev.id
    route_table_id = aws_route_table.dev.id
}
resource "aws_security_group" "dev" {
    vpc_id = aws_vpc.dev.id
    name="sg"
    description = "allow access"
    tags = {
      Name="custom_security_group"
    }
ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] 
  }
   }
   resource "aws_subnet" "dev2" {
     vpc_id = aws_vpc.dev.id
     cidr_block = "10.0.1.0/24"
     tags = {
       Name="custom_subnet_private"
     }
   }
  resource "aws_eip" "dev2" {
  domain   = "vpc"
  tags={
    Name="custom_eip"
  }
}
   #create nat gate way
   resource "aws_nat_gateway" "dev2" {
     subnet_id = aws_subnet.dev2.id
     allocation_id=aws_eip.dev2.id
     connectivity_type = "public"
     tags={
      Name="custom_nat_private"
     }
   }
   resource "aws_route_table" "dev2" {
     vpc_id = aws_vpc.dev.id
     tags={
      Name="custom_route_table_private"
  
     }
     route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.dev2.id
      }
     }
     resource "aws_route_table_association" "dev2" {
       subnet_id = aws_subnet.dev2.id
       route_table_id = aws_route_table.dev2.id
     }
     resource "aws_security_group" "dev2" {
    vpc_id = aws_vpc.dev.id
    name="allow tlc"
    description = "allow access"
    tags = {
      Name="custom_private"
    }
   ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
     }
    
   
  