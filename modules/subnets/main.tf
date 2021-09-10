resource "aws_subnet" "public_subnets" {
  count      = length(split(",", var.pub_sub))
  vpc_id     = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block  = element(split(",", var.pub_sub), count.index)
  availability_zone = element(split(",", var.availability_zone), count.index)


  tags = {
    Name = "${var.prod}.${var.env}-pub_sub.${count.index + 1}"
  }
}
