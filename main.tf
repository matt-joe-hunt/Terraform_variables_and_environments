provider "aws" {
  region = var.region-master
}

module "VPC" {
  source   = "./VPC"
  vpc-name = var.vpc-name[terraform.workspace]
}

module "SG" {
  source  = "./SG"
  sg-name = var.sg-name[terraform.workspace]
  vpc_id  = module.VPC.vpc_id
}

module "EC2" {
  source                      = "./EC2"
  instance-name               = var.instance-name[terraform.workspace]
  instance-type               = var.instance-type[terraform.workspace]
  public_subnet_A             = module.VPC.public_subnetA_id
  vpc_security_group_ids      = module.SG.aws_sg
  associate_public_ip_address = true
}