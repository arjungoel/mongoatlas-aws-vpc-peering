resource "mongodbatlas_project" "elasticsi_test" {
  name   = var.mongodbatlas_project_name
  org_id = var.mongodbatlas_orgid
}

resource "mongodbatlas_cluster" "elasticsi_cluster" {
  project_id = mongodbatlas_project.elasticsi_test.id
  name       = var.mongodbatlas_cluster
  # Provider Settings "block"
  provider_name               = "TENANT"
  backing_provider_name       = "AWS"
  provider_region_name        = "US_EAST_1"
  provider_instance_size_name = "M0"
}

resource "mongodbatlas_database_user" "elasticsi_db_user" {
  username           = var.mongodbatlas_db_username
  password           = var.mongodbatlas_db_password
  project_id         = mongodbatlas_project.elasticsi_test.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "dbadmin"
  }
  depends_on = [mongodbatlas_project.elasticsi_test]
}

resource "mongodbatlas_network_container" "elasticsi_container" {
  project_id       = mongodbatlas_project.elasticsi_test.id
  atlas_cidr_block = var.atlas_vpc_cidr_block
  provider_name    = "AWS"
  region_name      = "US_EAST_1"
}

resource "mongodbatlas_network_peering" "test" {
  accepter_region_name   = var.aws_region
  project_id             = mongodbatlas_project.elasticsi_test.id
  container_id           = mongodbatlas_network_container.elasticsi_container.id
  provider_name          = "AWS"
  route_table_cidr_block = aws_vpc.main.cidr_block
  vpc_id                 = aws_vpc.main.id
  aws_account_id         = var.aws_account_id
}

resource "mongodbatlas_project_ip_access_list" "test" {
  project_id = mongodbatlas_project.elasticsi_test.id
  cidr_block = aws_vpc.main.cidr_block
  comment    = "cidr block for AWS VPC"
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = mongodbatlas_network_peering.test.connection_id
  auto_accept               = true
}