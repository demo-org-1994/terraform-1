variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name prefix used for tagging all resources"
  type        = string
  default     = "demo-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Availability zone for both subnets"
  type        = string
  default     = "ap-south-1a"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "Name of an existing EC2 key pair for SSH access (leave empty to skip key-based access)"
  type        = string
  default     = ""
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to SSH into the public EC2 instance"
  type        = string
  default     = "0.0.0.0/0" # NOTE: restrict this to your own IP in real environments, e.g. "203.0.113.10/32"
}
