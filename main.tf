terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}
# module "ec2_instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "~> 3.0"

resource "aws_instance" "myec2" {

    ami                    = "ami-079b5e5b3971bd10d"
    instance_type          = "t2.micro"
    key_name               = "EC2 Tutorial"
    monitoring             = true
    vpc_security_group_ids = ["sg-0de4f20948e411ccf"]
    subnet_id              = "subnet-00c35bdb19a72f0e0"

    tags = {
      Terraform   = "true"
      Environment = "test"
  }
}
