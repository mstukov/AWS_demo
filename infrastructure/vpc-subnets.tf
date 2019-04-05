# Define the public subnet 1 

resource "aws_subnet" "public-subnet-1" {
  vpc_id = "${aws_default_vpc.R42test.id}"
  cidr_block = "${var.public_subnet_cidr_1}"
  availability_zone = "us-east-2a"

  tags {
    Name = "Front-end public subnet 1"
  }
}

# Define the public subnet 2

resource "aws_subnet" "public-subnet-2" {
  vpc_id = "${aws_default_vpc.R42test.id}"
  cidr_block = "${var.public_subnet_cidr_2}"
  availability_zone = "us-east-2b"

  tags {
    Name = "Front-end public subnet 2"
  }
}

# Define the public subnet 3

resource "aws_subnet" "public-subnet-3" {
  vpc_id = "${aws_default_vpc.R42test.id}"
  cidr_block = "${var.public_subnet_cidr_3}"
  availability_zone = "us-east-2c"

  tags {
    Name = "Front-end public subnet 3"
  }
}
