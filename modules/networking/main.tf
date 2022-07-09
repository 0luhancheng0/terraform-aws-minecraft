data "aws_availability_zones" "available" {}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name                             = "${var.namespace}-vpc"
  cidr                             = var.vpc_cidr
  azs                              = data.aws_availability_zones.available.names
  private_subnets                  = var.vpc_private_subnets
  public_subnets                   = var.vpc_public_subnets
  enable_nat_gateway               = true
  single_nat_gateway               = true
}

resource "aws_security_group" "allow_minecraft" {
  name        = "${var.namespace}-allow_minecraft"
  description = "Allow Minecraft inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Minecraft traffic from the internet"
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.namespace}-allow_minecraft"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "${var.namespace}-allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.namespace}-allow_ssh"
  }
  lifecycle {
    create_before_destroy = true
  }
}
