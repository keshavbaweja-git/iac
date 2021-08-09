resource "aws_vpc" "supernova_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
      Name = "supernova_vpc"
  }
}

resource "aws_subnet" "supernova_subnet_1_pub" {
  cidr_block        = "${cidrsubnet(aws_vpc.supernova_vpc.cidr_block, 4, 0)}"
  vpc_id            = "${aws_vpc.supernova_vpc.id}"
  availability_zone = "${lookup(var.subnet_zones, "supernova_subnet_1_pub")}"

  tags = {
      Name = "supernova_subnet_1_pub"
  }
}

resource "aws_subnet" "supernova_subnet_2_pri" {
  cidr_block        = "${cidrsubnet(aws_vpc.supernova_vpc.cidr_block, 4, 1)}"
  vpc_id            = "${aws_vpc.supernova_vpc.id}"
  availability_zone = "${lookup(var.subnet_zones, "supernova_subnet_2_pri")}"

  tags = {
      Name = "supernova_subnet_2_pri"
  }
}