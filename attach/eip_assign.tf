data "template_file" "init" {
  template = "${file("template/init.tpl")}"
	tags {
    "Name" = "My-user-data"
  } 
 
}
  
resource "aws_eip" "ip1" {
  instance = "${var.ec_instance_1}"
   user_data = "${data.template_file.init.rendered}"
   
   #user_data = <<EOF
   #sed -i 's/Instance2 from av zone 2/Instance1 from us-east-2a/g' /home/ubuntu/opstest-master/src/main/resources/application.properties
	#EOF
}

resource "aws_eip" "ip2" {
  instance = "${var.ec_instance_2}"
}

resource "aws_eip" "ip3" {
  instance = "${var.ec_instance_3}"
}