variable "backend_state" {
  description = "folder where the statefile will be stored"
  type = string
  default = "terraform/backend.tfstate"
}
variable "class_dev" {
  type = string
  default = "bootcamp30"
}
variable "region" {
  description = "s3 region"
  type = string
  default = "us-east-1"
}
variable "access" {
  description = "access control list for s3"
  type = string
  default = "private"
}
variable "versioning" {
  description = "versioning for s3"
  type = string
  default = "Enabled"
}
variable "kms_window" {
  description = "deletion window for kms"
  type = number
  default = "10"
}
variable "algorithm" {
  description = "sse algorithm"
  type = string
  default = "aws:kms"
}
