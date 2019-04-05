variable "ami" {
	description = "Launch configuration"
	default = "testR42"
}

variable "subnet_ids" {
  default = "subnet-0885fc2033aa881a7,subnet-0b0d89610cbbf68e3,subnet-0c7a6aa1ecf8f9719"
}

variable "vpc_id" {
	default = "vpc-81161ae9"
}

#variable "webapp_alb_name" {}

variable "security_group_id" {
	default = "sg-0c619cf5b61a67aaa"
}

