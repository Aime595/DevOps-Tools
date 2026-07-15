output "instance_public_dns" {
  description = "The public dns of the ec2 instance"
  value       = "http://${aws_instance.nginx1.public_dns}"
}

output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.app-vpc.id
}

output "public_subnet_id" {
  description = "pulic subnet id"
  value       = aws_subnet.public-subnet.id
}