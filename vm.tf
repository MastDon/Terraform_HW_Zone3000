resource "aws_instance" "VM" {
  count = 2
  ami = var.ami_ubuntu
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.zone3000_sg.id]
  subnet_id = "${aws_subnet.public.id}"
  tags = {
    Name = var.project_name
    Group = var.group_name
  }
}
resource "aws_instance" "VM_private" {
  ami = var.ami_ubuntu
  instance_type = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.zone3000_sg.id]
  subnet_id = "${aws_subnet.private.id}"
  tags = {
    Name = var.project_name
    Group = var.group_name
  }
}