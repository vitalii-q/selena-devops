output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "users_service_eip" {
  value = module.ec2.elastic_ip
}

output "amazon_linux_ami_id" {
  value       = module.ec2.amazon_linux_ami_id
  description = "The ID of the latest Amazon Linux 2023 AMI from the EC2 module"
}

output "users_service_s3_bucket" {
  value = module.users_service_s3.bucket_name
}

output "ec2_s3_access_profile_name" {
  value = module.iam.ec2_s3_access_profile_name
}

