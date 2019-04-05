provider "aws" {
  region = "us-east-2"
  version = "1.60"
	assume_role {
	role_arn = "arn:aws:iam::570989589733:role/ASG-operations"
  }
}

