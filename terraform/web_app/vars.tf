variable "region" {
  type        = string
  description = "aws region for deployment"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "vpc subnets range"
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "enable dns hostname for instances"
  default     = true
}

variable "subnet_cidr_block" {
  type        = string
  description = "public subnet ip address range"
  default     = "10.0.1.0/24"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "assing public ip address to instance at launch"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "the type of instance used"
}

variable "project" {
  type = string
  description = "the name of the project"
}

variable "environment" {
  type = string
  description = "target environment"
}

variable "company_name" {
  type = string
  description = "the name of the company"
  default = "Globaltech"
}

variable "billing_code" {
  type = string
  description = "code for billing"
}