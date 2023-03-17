variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = number
  default = 25
}

variable "engr" {
  description = "Engr incharge of this project"
  type = string
  default = "Oyin"
}
