# ASG-operations role and policy

resource "aws_iam_role" "ASG-operations" {
  name = "ASG-operations"
  assume_role_policy = "${file("./assumerolepolicy.json")}"
} 

resource "aws_iam_policy" "ASG-operations_policy" {
  name = "ASG-operations_policy"
  description = "ASG operations policy"
  policy = "${file("./ASG-operations-policy.json")}"
}

resource "aws_iam_policy_attachment" "R42-pol-attach" {
  name = "R42-pol-attach"
  roles = ["${aws_iam_role.ASG-operations.name}"]
  policy_arn = "${aws_iam_policy.ASG-operations_policy.arn}"
}

resource "aws_iam_instance_profile" "R42_profile" {
  name  = "R42-ASG_profile"
  roles = ["${aws_iam_role.ASG-operations.name}"]
}

#resource "aws_iam_group" "ASG-operations" {
#  name = "ASG-operations"
#  path = "/users/"
#}



