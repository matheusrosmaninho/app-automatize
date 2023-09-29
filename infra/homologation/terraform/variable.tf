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