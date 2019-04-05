resource "aws_security_group" "alb_http" {
  name        = "alb_sg_R42"
  description = "Allow HTTP traffic to instances through Application Load Balancer"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "HTTP through ALB Security Group"
  }
}

output "security_group_id" {
  value = "${aws_security_group.alb_http.id}"
}
