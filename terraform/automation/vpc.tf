# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_vpc" "sol-arch-test" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  ipv6_ipam_pool_id                    = null
  ipv6_netmask_length                  = 0
  region                               = "us-east-1"
  tags = {
    Name = "sol-arch-test"
  }
  tags_all = {
    Name = "sol-arch-test"
  }
}
