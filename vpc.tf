# Resources to be created:
// Create a VPC
// public route table and routes
// private route table and routes
// public and private subnets
// Internet Gateway
// NAT gateway
// EIP for NAT gateway

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "${var.default_tags.project_name}-vpc"
  }
  assign_generated_ipv6_cidr_block = true
  instance_tenancy                 = "default"
  enable_dns_hostnames             = true
  enable_dns_support               = true
}
// Update the default route table for AWS VPC peering with MongoDB Atlas VPC peering
resource "aws_default_route_table" "aws_mongodbatlas_tb" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = mongodbatlas_network_container.elasticsi_container.atlas_cidr_block
    gateway_id = mongodbatlas_network_peering.test.connection_id
  }
}