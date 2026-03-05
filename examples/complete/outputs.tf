
output "vpc" {
  value = module.vpc.vpc_id
}

output "public_subnet" {
  value = module.vpc.public_subnet_output  
}

output "private_subnet" {
  value = module.vpc.private_subnet_output  
}

output "direct_public_subnet" {
  value = module.vpc.direct_public_subnet
}

output "direct_private_subnet" {
  value = module.vpc.direct_private_subnet
}