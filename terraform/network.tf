data "aws_ssm_parameter" "vpc_cidr" {
	name = "vpc_cidr"
}
resource "aws_vpc" "main" {
	cidr_block = data.aws_ssm_parameter.vpc_cidr.value
}

# private subnets
data "aws_ssm_parameter" "vpc_cidr_private_AZa" {
	name = "vpc_cidr_private_AZa" 
}
resource "aws_subnet" "private_subnet_a" {
	#count = (length(data.aws_ssm_parameter.vpc_cidr_private_AZa.value) > 0)
	vpc_id = aws_vpc.main.id
	cidr_block = data.aws_ssm_parameter.vpc_cidr_private_AZa.value
}
#data "aws_ssm_parameter" "vpc_cidr_private_AZb" {
#}
#resource "aws_subnet" "private_subnet_b" {
#	vpc_id = aws_vpc.main.id
#	cidr_block = data.aws_ssm_parameter.vpc_cidr_private_AZb.value
#}
#data "aws_ssm_parameter" "vpc_cidr_private_AZc" {
#}
#resource "aws_subnet" "private_subnet_c" {
#	vpc_id = aws_vpc.main.id
#	cidr_block = data.aws_ssm_parameter.vpc_cidr_private_AZc.value
#}
#
## public subnets
#data "aws_ssm_parameter" "vpc_cidr_public_AZa" {
#}
#resource "aws_subnet" "public_subnet_a" {
#	vpc_id = aws_vpc.main.id
#	cidr_block = data.aws_ssm_parameter.vpc_cidr_public_AZa.value
#}
#data "aws_ssm_parameter" "vpc_cidr_public_AZb" {
#}
#resource "aws_subnet" "public_subnet_b" {
#	vpc_id = aws_vpc.main.id
#	cidr_block = data.aws_ssm_parameter.vpc_cidr_public_AZb.value
#}
#data "aws_ssm_parameter" "vpc_cidr_public_AZc" {
#}
#resource "aws_subnet" "public_subnet_c" {
#	vpc_id = aws_vpc.main.id
#	cidr_block = data.aws_ssm_parameter.vpc_cidr_public_AZc.value
#}



# INFO: Consider fot the future: VPC with CIDR from AWS IPAM:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc


# vpc_cidr: "10.64.18.0/23"
# vpc_cidr_private: "10.64.18.0/24"
# vpc_cidr_private_AZa: "10.64.18.0/26"
# vpc_cidr_private_AZb: "10.64.18.64/26"
# vpc_cidr_private_AZc: "10.64.18.128/26"
# vpc_cidr_prublic: "10.64.19.0/24"
# vpc_cidr_public_AZa: "10.64.19.0/26"
# vpc_cidr_public_AZb: "10.64.19.64/26"
# vpc_cidr_public_AZc: "10.64.19.128/26"
