terraform {
  backend "s3" {
    bucket = "xyzjdaskjf"
    key= "day5/terraform.tfstate"
    region = "ap-south-2"
    //dynamodb_table = "terraform-state-lock-dynamos" # DynamoDB table used for state locking, note: first run day-4-statefile-s3
    //encrypt        = true  # Ensures the state is encrypted at rest in S3.
  }
}