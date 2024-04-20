#INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

#ELASTIC IP
resource "aws_eip" "eip" {
  tags = {
    Name = var.eip_name
  }
}

#NAT GATEWAY
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pub_sub_1.id

  tags = {
    Name = var.nat_name
  }

  depends_on = [aws_internet_gateway.igw]
}

#ROUTE TABLE
#PUBLIC ROUTE TABLE
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.pub_rt_name
  }
}

#PRIVATE ROUTE TABLE
resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = var.pvt_rt_name
  }
}

#ROUTE TABLE ASSOCIATION
#PUBLIC ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "pub_rt_as_1" {
  subnet_id      = aws_subnet.pub_sub_1.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_rt_as_2" {
  subnet_id      = aws_subnet.pub_sub_2.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pvt_rt_as_1" {
  subnet_id      = aws_subnet.pvt_sub_1.id
  route_table_id = aws_route_table.pvt_rt.id
}

resource "aws_route_table_association" "pvt_rt_as_2" {
  subnet_id      = aws_subnet.pvt_sub_2.id
  route_table_id = aws_route_table.pvt_rt.id
}
