resource "aws_s3_bucket" "bucket" {
    bucket = "xyzjdaskjf" 
}
resource "aws_dynamodb_table" "Dynamodb" {
  name = "terraform-state-lock-dynamos"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}
