variable "lb_tg_arn" {
  type    = "string"
  default = ""
}

variable "lb_tg_name" {
  type    = "string"
  default = ""
}

data "aws_lb_target_group" "R42TG" {
  arn  = "${var.lb_tg_arn}"
  name = "${var.lb_tg_name}"
}

resource "aws_alb_target_group_attachment" "alb_frontend1" {
 target_group_arn = "${var.arn}"
  target_id        = "${var.ec_instance_1}"
  port             = 8081
}

resource "aws_alb_target_group_attachment" "alb_frontend2" {
 target_group_arn = "${var.arn}"
  target_id        = "${var.ec_instance_2}"
  port             = 8081
}

resource "aws_alb_target_group_attachment" "alb_frontend3" {
 target_group_arn = "${var.arn}"
  target_id        = "${var.ec_instance_3}"
  port             = 8081
}


#output "server_id1" {
#  value = "${element(aws_instance.prod_server.*.id, 0)}"
#}