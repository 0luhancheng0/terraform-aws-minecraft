# terraform-aws-minecraft

Terraform module for deploying a simple Minecraft on AWS

## Dependencies

* [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

You also need to setup your [aws credential file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

## Configuration

Infrastructure configration is available at [variables.tf](./variables.tf), which defines a set variables (including instance_type, volume_size etc.) for terraform.

Server specific configuration is available at [master.yaml](./master.yaml), the list of available variables are defined in this [main.yml](./roles/ansible-minecraft/defaults/main.yml).

If you dont have an available domain name registered under aws route53 you can just comment out module route53 section in [main.tf](main.tf)

## Credit

Ansible role is developped base on [ansible minecraft](https://github.com/devops-coop/ansible-minecraft)