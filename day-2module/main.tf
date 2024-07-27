provider "aws"{
region="us-east-1"
}
resource "aws_instance" "demo" {
count = 1
ami =var.ami_id
instance_type = var.instancetype
key_name = var.keyvalue
tags={
Name="xyz"
}
}
