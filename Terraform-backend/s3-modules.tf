resource "aws_s3_bucket" "s3_bucket" {
  bucket = "bootcamp-25-oyin"                 
  tags = local.common_tags
}

resource "aws_s3_bucket_acl" "my_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl = var.access
}

resource "aws_dynamodb_table" "tf_lock" {
  name = "terraform-lock"
  hash_key = "LockID"
  read_capacity = 3
  write_capacity = 3
  attribute {
     name = "LockID"
     type = "S"
   }
  tags = {
    Name = "Terraform Lock Table"
   }
 }