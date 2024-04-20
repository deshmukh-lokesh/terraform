#VPC
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

#SUBNETS
#PUBLIC SUBNET
resource "aws_subnet" "pub_sub_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_sub_1_cidr_block

  tags = {
    Name = var.pub_sub_1_name
  }
}

resource "aws_subnet" "pub_sub_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_sub_2_cidr_block

  tags = {
    Name = var.pub_sub_2_name
  }
}

#PRIVATE SUBNET
resource "aws_subnet" "pvt_sub_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pvt_sub_1_cidr_block

  tags = {
    Name = var.pvt_sub_1_name
  }
}

resource "aws_subnet" "pvt_sub_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pvt_sub_2_cidr_block

  tags = {
    Name = var.pvt_sub_2_name
  }
}