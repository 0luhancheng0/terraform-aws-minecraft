module "networking" {
  source    = "./modules/networking"
  namespace = var.namespace
  vpc_cidr  = var.vpc_cidr
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets = var.vpc_public_subnets
}

module "ssh-key" {
  source    = "./modules/ssh-key"
  namespace = var.namespace
}

module "ec2" {
  source     = "./modules/ec2"
  namespace  = var.namespace
  vpc        = module.networking.vpc
  security_group_ids = module.networking.security_group_ids
  key_name   = module.ssh-key.key_name
  volume_size = var.volume_size
}

module "route53" {
  source = "./modules/route53"
  domain = var.domain
  public_ips = [module.ec2.public_ip]
}

resource "null_resource" "provision" {
  provisioner "local-exec" {
    command = "ansible-playbook --private-key ${path.root}/${module.ssh-key.key_name}.pem -i '${module.ec2.public_ip},' ${path.root}/master.yaml"
  }
}
