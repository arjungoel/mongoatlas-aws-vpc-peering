variable "aws_region" {
  type        = string
  description = "AWS Region to be utilized"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access key for IAM user"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS Secret access key for IAM user"
}

variable "cidr_block" {
  type        = string
  description = "VPC CIDR Block"
}

variable "default_tags" {
  type        = map(string)
  description = "Tagging used for AWS resource"
}

variable "mongodbatlas_public_key" {
  type        = string
  description = "Public key for MongoDB Atlas"
}

variable "mongodbatlas_private_key" {
  type        = string
  description = "Private key for MongoDB Atlas"
}

variable "mongodbatlas_orgid" {
  type        = string
  description = "Organization ID of MongoDB Atlas"
}

variable "mongodbatlas_project_name" {
  type        = string
  description = "MongoDB Atlas Project Name"
}

variable "mongodbatlas_cluster" {
  type        = string
  description = "MongoDB Atlas cluster name"
}

variable "mongodbatlas_db_username" {
  type        = string
  description = "MongoDB Atlas DB Username"
}

variable "mongodbatlas_db_password" {
  type        = string
  description = "MongoDB Atlas DB Password"
}

variable "atlas_vpc_cidr_block" {
  type        = string
  description = "MongoDB Atlas VPC CIDR block"
}

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID to be peered with MongoDB Atlas"
}