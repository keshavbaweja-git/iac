resource "aws_internet_gateway" "supernova_igw" {
  vpc_id = "${aws_vpc.supernova_vpc.id}"

  tags = {
    Name = "supernova_igw"
  }
}

resource "aws_eip" "supernova_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.supernova_igw]

  tags = {
    Name = "supernova_eip"
  }
}


resource "aws_nat_gateway" "supernova_natgw" {
  allocation_id = "${aws_eip.supernova_eip.id}"
  subnet_id     = "${aws_subnet.supernova_subnet_1_pub.id}"

  tags = {
    Name = "supernova_natgw"
  }
}