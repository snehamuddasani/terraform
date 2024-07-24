resource "aws_s3_bucket" "name" {
  bucket = "xyzdjfhdjnkjnfbucket"
}
resource "aws_dynamodb_table" "dynamodb"{
    name="sneha-dynamodb"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20
    attribute {
      name= "LockID"
      type = "S"
    }
}