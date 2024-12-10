provider "aws" {
  region = var.aws_region
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = "ami-070fe338fb2265e00" 
  instance_type = "t3.micro"
  key_name      = "testing1"
  instance_name = "MyInstance"
}

module "vpc" {
  source            = "./modules/vpc"
  cidr_block        = "10.0.0.0/16"
  vpc_name          = "MyVPC"
  subnet_count      = 2
  subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["eu-north-1a", "eu-north-1b"]
}