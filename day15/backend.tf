terraform {
  backend "s3" {
    bucket = "xyzxyzxyz"
    key = "day15/terraform.tfstate"
    region = "ap-south-2"
    dynamodb_table = "dynamodbx"
    encrypt=true
  }
}