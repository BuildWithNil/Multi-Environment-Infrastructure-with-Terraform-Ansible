#dev-infra
module "dev-infra" {
  source = "./infra"
  env = "dev"
  instance_type = "t3.small"
  instance_count = 2
  ami = "ami-0de864d6a3bd20ea8"
  volume_size = 10
  }






#stg-infra
module "stg-infra" {
  source = "./infra"
  env = "stg"
  instance_type = "t3.micro"
  instance_count = 2
  ami = "ami-0de864d6a3bd20ea8"
  volume_size = 10
  }







#prd-infra
module "prd-infra" {
  source = "./infra"
  env = "prd"
  instance_type = "m7i-flex.large"
  instance_count = 3
  ami = "ami-0de864d6a3bd20ea8"
  volume_size = 10
  }

  

output "dev_infra_ec2_public_ips" {
  value = module.dev-infra.ec2_public_ips
}

output "dev_infra_ec2_private_ips" {
  value = module.dev-infra.ec2_private_ips
}

output "stg_infra_ec2_public_ips" {
  value = module.stg-infra.ec2_public_ips
}

output "stg_infra_ec2_private_ips" {
  value = module.stg-infra.ec2_private_ips
}

output "prd_infra_ec2_public_ips" {
  value = module.prd-infra.ec2_public_ips
}

output "prd_infra_ec2_private_ips" {
  value = module.prd-infra.ec2_private_ips
}