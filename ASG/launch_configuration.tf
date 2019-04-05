resource "aws_launch_configuration" "R42-test" {
  name="R42-test"
  
  image_id = "ami-0c05aafa10bef9d21"
  instance_type = "t2.micro"
  key_name = "myKeyPair"

  security_groups = ["${split(",", var.security_group_id)}"]
  associate_public_ip_address = true
lifecycle {
create_before_destroy = true
  }
}