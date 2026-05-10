variable "env" {
  description = "This is the environment name eg. dev/stg/prd"
  type = string
}

variable "instance_type" {
  description = "This is the instance type for EC2 eg. t3.micro/t3.small/m7i-flex.large"
  type = string
}

variable "instance_count" {
  description = "This is the count of number of EC2 instances I need"
  type = number
}

variable "ami" {
  description = "This is the AMI(Amazon Machine Image) ID for EC2 instance"
  type = string
}

variable "volume_size" {
  description = "This is the volume size of root EBS(Elastic Block Store) for EC2 instance in GB"
  type = number
}