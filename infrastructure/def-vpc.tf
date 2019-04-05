# Definition for VPC

resource "aws_default_vpc" "R42test" {
  tags = {
    Name = "Default VPC"
  }
}
