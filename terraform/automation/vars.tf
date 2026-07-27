variable "region" {
  type        = string
  description = "aws region to deploy infrastructure"
  default     = "us-east-1"
}

variable "role_arn" {
  type        = string
  description = "deployment role"
  default     = "arn:aws:iam::540945239943:role/delegateAdmin"
}

variable "company" {
    type = string
    description = "name of the company"
    default = "ReservePartners"
}

variable "project" {
    type = string
    description = "name of the project"
    default = "CAI creds" 
}

variable "name_prfix" {
    type = string
    description = "prefix for resource names"
    default = null
}

variable "tags" {
    type = map(string)
    description = "tags to assign to resources"
    default = null
}

variable "environment" {
    type = string
    description = "the target environmet"
}