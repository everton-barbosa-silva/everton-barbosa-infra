resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "everton-barbosa-db-cluster"
  engine                  = "aurora-postgresql"
  master_username         = var.db_username
  master_password         = var.db_password
  availability_zones      = data.aws_availability_zones.available.names
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
}

resource "aws_db_subnet_group" "main" {
  name       = "everton-barbosa-db-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]
  }
}

data "aws_availability_zones" "available" {}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}
