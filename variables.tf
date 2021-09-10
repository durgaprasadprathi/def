variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

#The Workspace Name. Defaults to a Random String if not provided
variable "workspace_name" {
  type = string
  description = "The Workspace Name associated with this stack"

# Variables for VPC

variable "vpc_cidr" {

}

variable "tenancy" {
  default = "default"
}

variable "product" {

}
variable "environment" {

}

# Variables for Subnets

variable "public_subnets" {

}

variable "vpc_id" {
  type = string
}

variable "availability_zones" {

}

variable "product" {

}
variable "environment" {

}


