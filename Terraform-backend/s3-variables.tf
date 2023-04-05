variable "aws_region" {
  description = "provider region"
  type = string
  default = "us-east-1"
}
variable "algorithm" {
  description = "sse algorithm"
  type = string
  default = "aws:kms"
}

variable "name" {
  description = "Name of Engr"
  type = string
  default = "oyin"
}

