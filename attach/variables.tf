variable "ami" {
	description = "Launch configuration"
	default = "R42_LC_2"
}

variable "subnet_ids" {
  default = "subnet-0885fc2033aa881a7,subnet-0b0d89610cbbf68e3,subnet-0c7a6aa1ecf8f9719"
}

variable "vpc_id" {
	default = "vpc-81161ae9"
}

variable "ec_instance_1" {
	default = "i-04d3b71aa38d7f9b5"
}

variable "ec_instance_2" {
	default = "i-0c30ba9733a1fc518"
}

variable "ec_instance_3" {
	default = "i-0f0926b2879b49d78"
}

variable "arn" {
	default = "arn:aws:elasticloadbalancing:us-east-2:570989589733:targetgroup/test-TG/2e49541d7af338b2"
}