region                  = "ap-south-1"

vpc_cidr_block          = "10.0.0.0/16"

vpc_name                = "terraform-vpc"

pub_sub_1_cidr_block    = "10.0.1.0/24"

pub_sub_1_name          = "public-subnet-1"

pub_sub_2_cidr_block    = "10.0.2.0/24"

pub_sub_2_name          = "public-subnet-2"

pvt_sub_1_cidr_block    = "10.0.3.0/24"

pvt_sub_1_name          = "private-subnet-1"

pvt_sub_2_cidr_block    = "10.0.4.0/24"

pvt_sub_2_name          = "private-subnet-2"

igw_name                = "terraform-igw"

eip_name                = "terraform-eip"

nat_name                = "terraform-nat"

pub_rt_name             = "public-rt"

pvt_rt_name             = "private-rt"

instance_type           = "t2.micro"

az                      = "ap-south-1b"

instance_name           = "terraform-instance"