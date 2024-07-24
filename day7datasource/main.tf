data "aws_ami" "amzlinux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name="name"
    values=["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name="root-device-type"
    values = ["ebs"]
  }
  filter {
    name="architecture"
    values = ["x86_64"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_subnet" "subnet" {
filter {
  name="tag:Name"
  values = ["cust-subnet-pub"]
}
}
resource "aws_instance" "data" {
  ami=data.aws_ami.amzlinux.id
  key_name = "dynamodb"
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.subnet.id
}