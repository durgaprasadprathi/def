terraform {
  required_providers {
    aws ={
      version = "~>3.53"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}


resource "aws_vpc" "vpc" {

  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"
  tags = {
    Name = "${var.product}.${var.environment}-vpc"
  }
}

resource "aws_subnet" "public_subnets" {

  count      = length(split(",", var.public_subnets))
  availability_zone = element(split(",", var.availability_zones), count.index)
  vpc_id     = aws_vpc.vpc.id
  cidr_block  = element(split(",", var.public_subnets), count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.product}.${var.environment}-public_subnets.${count.index + 1}"
  }
}
