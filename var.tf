variable "name" {
  type = string
  description = "name of the vpc"
}

variable "cidr_block" {
  type = string
  description = "cidr block for vpc"
  default = "10.90.0.0/20"
}

variable "public_subnet_cidr_block" {
  default = "10.90.0.0/24"
}
~
