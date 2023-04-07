resource "aws_kms_key" "backendKMS" {
  description      = "This key is used to encrypt bucket objects"
}

resource "random_integer" "random" {
  min = 1
  max = 50000
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "bootcamp-${random_integer.random.result}-${var.name}" 

  server_side_encryption_configuration {
    rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.backendKMS.arn
      sse_algorithm     = var.algorithm
     }
   }
  }        
}
