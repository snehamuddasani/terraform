//creating s3 bucket
resource "aws_s3_bucket" "bucketname" {
  bucket = "xyzxyzxyz"
}
//creating dynamodb table
resource "aws_dynamodb_table" "creatingdynamodbtable" {
  name = "dynamodbx"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
  attribute {
    name="LockID"
    type = "S"
  }
}