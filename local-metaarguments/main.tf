locals {
    bucket-name="${var.layer}-${var.env}-bucket-hyderabad"

}
resource "aws_s3_bucket" "local" {
  bucket = local.bucket-name
  tags = {
    Name=local.bucket-name
    environment=var.env
  }
}