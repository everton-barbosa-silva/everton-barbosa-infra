
variable "db_username" {}
variable "db_password" {}
variable "vpc_id" {}
variable "ec2_sg_id" {}
variable "private_subnet_ids" {
  type = list(string)
}



#ideal era usar um cofre de senha, infelizmente no cenário dessa entrevista, não teria como 