provider "aws" {
  region = "us-east-1"  #NÃO MUDAR A REGIÃO NO TESTE, PODE AFETAR A AMI
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source           = "./modules/ec2"
  vpc_id           = module.vpc.vpc_id
  subnet_id        = element(module.vpc.private_subnet_ids, 0)
  ami_id           = "ami-0c55b159cbfafe1f0"  
  instance_type    = "t2.micro"
}

module "rds" {
  source             = "./modules/rds"
  vpc_id             = module.vpc.vpc_id
  ec2_sg_id          = module.ec2.ec2_sg_id
  private_subnet_ids = module.vpc.private_subnet_ids  
  db_username        = "admin"
  db_password        = "password123"
}

module "s3" {
  source = "./modules/s3"
}
