# Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "${var.env}-terra-automate-key"
  public_key = file("nil-terra-key.pub")
}

# Default VPC
resource "aws_default_vpc" "default" {}

# # Get Subnets
# data "aws_subnets" "default" {
#   filter {
#     name   = "vpc-id"
#     values = [aws_default_vpc.default.id]
#   }
# }

# Security Group
resource "aws_security_group" "allow_user_to_connect" {
  name        = "${var.env}-nil-devops-sg"
  description = "Allow user to connect via sg"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "SSH (port 22 allowed for SSH)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP (port 80 allowed for HTTP)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS (port 443 allowed for HTTPS)"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound (All traffic allowed)"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.env}-nil-devops-sg"
    Environment = var.env
  }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  count           = var.instance_count
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.allow_user_to_connect.name]

  tags = {
    Name        = "${var.env}-nil-devops-app-instance"
    Environment = var.env
  }

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
  }
}