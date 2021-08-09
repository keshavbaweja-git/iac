resource "aws_default_route_table" "rtb" {
  default_route_table_id = "${aws_vpc.supernova_vpc.default_route_table_id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.supernova_natgw.id}"
  }

  tags = {
    Name = "supernova_default_rtb"
  }
}

resource "aws_route_table" "supernova_rtb_pub" {
  vpc_id = "${aws_vpc.supernova_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.supernova_igw.id}"
  }

  tags = {
    Name = "supernova_rtb_pub"
  }
}

resource "aws_route_table_association" "supernova_rtb_assoc" {
  subnet_id      = "${aws_subnet.supernova_subnet_1_pub.id}"
  route_table_id = "${aws_route_table.supernova_rtb_pub.id}"
}