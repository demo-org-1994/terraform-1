# Latest Amazon Linux 2023 AMI, resolved dynamically so we don't hardcode an AMI ID
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "public_ec2" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name != "" ? var.key_pair_name : null

  tags = {
    Name = "${var.project_name}-public-ec2"
  }
}

# Private EC2 instance - no public IP, reachable only from within the VPC (e.g. via the public
# instance as a bastion/jump host, or SSM Session Manager if you attach an instance profile for it)
resource "aws_instance" "private_ec2" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  key_name                    = var.key_pair_name != "" ? var.key_pair_name : null

  tags = {
    Name = "${var.project_name}-private-ec2"
  }
}
