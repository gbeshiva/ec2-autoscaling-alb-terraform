variable "region" {
  description = "The security group IDs to associate with the EC2 instance"
  type        = string
  default = "ap-south-1"
}

  variable "ami_id" {
  description = "The subnet ID to launch the EC2 instance in"
  type        = string
    default = "ami-084568db4383264d4" 
}
variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}
variable "desire_count" {
  description = "The desired number of instances in the Auto Scaling group."
  type        = number
  default     = 2
}

variable "min_count" {
  description = "The minimum number of instances in the Auto Scaling group."
  type        = number
  default     = 1
}

variable "max_count" {
  description = "The maximum number of instances in the Auto Scaling group."
  type        = number
  default     = 3
}

variable "vpc_zone_identifier" {
  description = "vpc zone identifier."
  type        = list(string)
  default = ["subnet-05e8246ee8cfc2f10", "subnet-0a97ef145f6b2278a"]
}
variable "security_group_id" {
  description = "security group id."
  type        = list(string)
  default = ["sg-04c604c14f641650e"]
}
variable "subnet_ids" {
  description = "The VPC subnets for the Auto Scaling group."
  type        = list(string)
  default = ["subnet-05e8246ee8cfc2f10", "subnet-0a97ef145f6b2278a"]
}
variable "vpc_id" {
  description = "default vpc id"
  type        = string
  default     = "vpc-0a31b3ff4ffc4c104"
}
