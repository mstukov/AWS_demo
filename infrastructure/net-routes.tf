data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = ["${var.vpc_id}"]
  }
}

# Define the route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_default_vpc.R42test.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${data.aws_internet_gateway.default.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}

# Assign the route table to the public subnet

resource "aws_route_table_association" "web-public-rt-1" {
  subnet_id = "${aws_subnet.public-subnet-1.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}

resource "aws_route_table_association" "web-public-rt-2" {
  subnet_id = "${aws_subnet.public-subnet-2.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}

resource "aws_route_table_association" "web-public-rt-3" {
  subnet_id = "${aws_subnet.public-subnet-3.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}