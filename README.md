# AWS_demo
The Terraform project provisions/configures: 
1. Three EC2 instances in us-east-2a, us-east-2b, us-east-2a availability zones;  
2. Default VPC and two security groups (firewalls), three public subnets, default gateway;  
3. Three IAM operational roles in charge of Infrastructure, Application and AutoScaling Group management;
4. AutoScalling Group and HTTP application load balancer; 
5. Three Elastic IPs;

There are in the EC instance image: Ubuntu 18.06, the SpringBoot sample app running under Apache Tomcat, some IT-security toolest and the best practices on IT-security.

To run Terraform project:

terraform init
terraform plan
terraform deploy
