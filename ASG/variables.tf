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

variable "security_group_id" {
	default = "sg-04062351676ed952d"
}