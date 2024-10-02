output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_sg_id" {
  value = module.ec2.ec2_sg_id
}

output "rds_sg_id" {
  value = module.rds.rds_sg_id
}
