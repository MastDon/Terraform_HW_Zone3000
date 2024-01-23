resource "aws_vpc" "zone12000_vpc" {
  cidr_block = var.cidr_block_vpc
  tags = {
    Name = var.project_name
  }
}

resource "aws_subnet" "public" {
  cidr_block = var.cidr_block_public
  vpc_id = "${aws_vpc.zone3000_vpc.id}"
  map_public_ip_on_launch = true
  tags = {
    Name = var.project_name
  }
}

resource "aws_subnet" "private" {
  cidr_block = var.cidr_block_private
  vpc_id = "${aws_vpc.zone2000_vpc.id}"
  tags = {
    Name = var.project_name
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = "${aws_vpc.zone3000_vpc.id}"
  tags = {
    Name = var.project_name
  }
}

resource "aws_security_group" "zone3000_sg" {
  tags = {
    Name = var.project_name
  }
  vpc_id = "${aws_vpc.zone3000_vpc.id}"
  dynamic "ingress" {

    for_each = [
      "80",
      "8080",
      "3000",
      "22",
      "443"]

    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [
        var.cidr_block_vpc,
        var.cidr_block_public,
        var.cidr_block_private
      ]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]

  }
}
