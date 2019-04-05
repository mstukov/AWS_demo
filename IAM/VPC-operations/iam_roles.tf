# VPC-operations role and policy

#These things are super confusing (Amazon's fault, not Terraform), but you have your policies backwards. 
#The one with "sts:AssumeRole" needs to be assigned to the `assume_role_policy` field of `aws_iam_role` and the one with the `Resource` 
#goes under `policy` in `aws_iam_role_policy`.

resource "aws_iam_role" "VPC-operations" {
  name = "VPC-operations"
  assume_role_policy = "${file("./assumerolepolicy.json")}"
} 

resource "aws_iam_policy" "VPC-operations_policy" {
  name = "VPC-operations_policy"
  description = "VPC operations policy"
  policy = "${file("./VPC-operations-policy.json")}"
}

resource "aws_iam_policy_attachment" "R42-pol-attach" {
  name = "R42-pol-attach"
  roles = ["${aws_iam_role.VPC-operations.name}"]
  #policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  policy_arn = "${aws_iam_policy.VPC-operations_policy.arn}"
}

resource "aws_iam_instance_profile" "R42_profile" {
  name  = "VPC-R42_profile"
  roles = ["${aws_iam_role.VPC-operations.name}"]
}


