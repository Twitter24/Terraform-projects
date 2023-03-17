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

 resource "aws_s3_bucket_versioning" "my_versioncontrol" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.versioning
  }
}

resource "aws_kms_key" "backendKMS" {
  description      = "This key is used to encrypt bucket objects"
  deletion_window_in_days = var.kms_window
}

resource "aws_s3_bucket_server_side_encryption_configuration" "config" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.backendKMS.arn
      sse_algorithm     = var.algorithm
     }
   }
 }
