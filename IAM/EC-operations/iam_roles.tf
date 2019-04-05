# EC-operations role and policy

resource "aws_iam_role" "EC-operations" {
  name = "EC-operations"
  assume_role_policy = "${file("./assumerolepolicy.json")}"
} 

resource "aws_iam_policy" "EC-operations_policy" {
  name = "EC-operations_policy"
  description = "EC operations policy"
  policy = "${file("./EC-operations-policy.json")}"
}

resource "aws_iam_policy_attachment" "R42-pol-attach" {
  name = "R42-pol-attach"
  roles = ["${aws_iam_role.EC-operations.name}"]
  policy_arn = "${aws_iam_policy.EC-operations_policy.arn}"
}

resource "aws_iam_instance_profile" "R42_profile" {
  name  = "R42-EC_profile"
  roles = ["${aws_iam_role.EC-operations.name}"]
}

#resource "aws_iam_group" "EC-operations" {
#  name = "EC-operations"
#  path = "/users/"
#}



