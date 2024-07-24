terraform {
  backend "s3" {
    bucket = "xyzdjfhdjnkjnfbucket"
    key = "dynamo-db/terraform.tfstate"
    region = "ap-south-2"
   dynamodb_table = "sneha-dynamodb"
   encrypt=true
  }
}