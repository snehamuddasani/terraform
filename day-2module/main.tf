resource "aws_instance" "demo" {
ami =var.ami_id
instance_type = var.instancetype
key_name = var.keyvalue
tags = {
  Name="qwerty"
}
}
provider "aws"{
region="us-east-1"
}
