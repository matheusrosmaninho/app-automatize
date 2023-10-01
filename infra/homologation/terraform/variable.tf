variable "prefixCidr" {
  type = string
  default = "10.0"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "appName" {
  type = string
  default = "app-autodeploy"
}

variable "productName" {
  type = string
  default = "matheusrosmaninho"
}

variable "env" {
  type = string
  default = "develop"
}

variable "ec2PublicKey" {
  type = string
  sensitive = true
}

variable "ec2Ami" {
  type = string
  default = "ami-03a6eaae9938c858c"
}

variable "ec2InstanceType" {
  type = string
  default = "t2.micro"
}

variable "zoneId" {
  type = string
  sensitive = true
}

variable "domain" {
  type = string
  default = "rosmano.com.br"
}