resource "aws_alb_target_group" "R42TG" {
  name = "test-TG"
  port = 8081
  protocol = "HTTP"
  vpc_id = "${var.vpc_id}"
  
  health_check {
    interval = 30
    path = "/hello"
    port = 8081
    healthy_threshold = 3
    unhealthy_threshold = 3
    timeout = 5
	}
}
resource "aws_alb" "app_load_balancer" {
  name = "R42-webapp-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = ["${split(",", var.security_group_id)}"]
  #security_groups = ["${aws_security_group.alb_http.id}"]
  subnets = ["${split(",",var.subnet_ids)}"]
  tags {
      Name = "Application Load Balancer"
  }
}

resource "aws_alb_listener" "http_listener" {
  port = "80"
  protocol = "HTTP"
  load_balancer_arn = "${aws_alb.app_load_balancer.arn}"

  default_action {
    target_group_arn = "${aws_alb_target_group.R42TG.arn}"
    type = "forward"
  }
}

resource "aws_alb_listener_rule" "my_rule" {
  listener_arn = "${aws_alb_listener.http_listener.arn}"
  priority = 10

  action {
    type = "forward"
    target_group_arn = "${aws_alb_target_group.R42TG.arn}"
  }

  condition {
    field = "path-pattern"
    values = ["/hello"]
  }
}
