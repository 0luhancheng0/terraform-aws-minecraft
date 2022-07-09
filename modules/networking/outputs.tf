output "vpc" {
  value = module.vpc
}

output "security_group_ids" {
  value = [aws_security_group.allow_ssh.id, aws_security_group.allow_minecraft.id]
}

