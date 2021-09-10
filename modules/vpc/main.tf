resource "aws_vpc" "vpc" {
  cidr_block       = "${var.cidr_block}"
  instance_tenancy = "${var.tenancy}"
  tags = {
    Name = "${var.prod}.${var.env}-vpc"
  }
}
