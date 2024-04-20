#EC2 Instance
resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  count         = 2
  subnet_id     = aws_subnet.pub_sub_1.id

  tags = {
    Name = "${var.instance_name}-${count.index + 1}"
  }
}