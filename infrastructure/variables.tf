variable "vpc_cidr" {
  description = "CIDR for the VPC"
  #default = "10.10.0.0/16"
  default = "172.32.0.0/16"
}

variable "public_subnet_cidr_1" {
  description = "CIDR for the public subnet"
  default = "172.32.0.64/28"
}

variable "public_subnet_cidr_2" {
  description = "CIDR for the public subnet"
  default = "172.32.0.128/28"
}

variable "public_subnet_cidr_3" {
  description = "CIDR for the public subnet"
  default = "172.32.0.192/28"
}


variable "vpc_id" {
	default = "vpc-81161ae9"
}
