variable "project_name" {
  type = string
  default = "Zone3000HW"
}
variable "region_name" {
  type = string
  default = "eu-central-1"
}

variable "group_name" {
  type = string
  default = "zone3000"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "cidr_block_vpc" {
  type = string
  default = "10.0.0.0/24"
}

variable "cidr_block_public" {
  type = string
  default = "10.0.0.0/25"
}

variable "cidr_block_private" {
  type = string
  default = "10.0.0.128/25"
}

variable "ami_ubuntu" {
  type = string
  default = "ami-0b418580298265d5c"
}