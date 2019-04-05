variable "lb_arn" {
  type    = "string"
  default = ""
}

variable "alb_name" {
  type    = "string"
  default = ""
}

data "aws_lb" "alb_http" {
  arn  = "${var.lb_arn}"
  name = "${var.alb_name}"
}

resource "aws_autoscaling_group" "R42_asg" {
  lifecycle { create_before_destroy = true }
  vpc_zone_identifier = "${list(var.subnet_ids)}" 
  name = "R42_ASG"
  max_size = 3
  min_size = 3
  wait_for_elb_capacity = false
  force_delete = true
  launch_configuration = "${var.ami}"
  load_balancers = ["${var.alb_name}"]
  tag {
    key = "Name"
    value = "R42_Instance"
    propagate_at_launch = "true"
  }
}