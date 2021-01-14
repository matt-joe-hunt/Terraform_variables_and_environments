variable "region-master" {
  type    = string
}

# VPC Variables

variable "vpc-name" {
  type        = map(string)
  description = "The name that we will give to our VPC"
}

# SG Variables

variable "sg-name" {
  type        = map(string)
  description = "The name that we will give to our Security Group"
}

# EC2 variables

variable "instance-name" {
  type        = map(string)
  description = "The name that we will give to our instance"
}

variable "instance-type" {
  type        = map(string)
  description = "The instance type that we will use"
}



