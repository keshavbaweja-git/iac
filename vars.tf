variable "region" {}
variable "vpc_cidr" {}
variable "subnet_zones" {
  type = map(string)
}