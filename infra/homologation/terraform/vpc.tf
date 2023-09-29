module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "${var.prefixCidr}.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["${var.prefixCidr}.1.0/24", "${var.prefixCidr}.2.0/24", "${var.prefixCidr}.3.0/24"]
  public_subnets  = ["${var.prefixCidr}.101.0/24", "${var.prefixCidr}.102.0/24", "${var.prefixCidr}.103.0/24"]

  enable_nat_gateway = true

  tags = {
    Name = "${var.appName}-${var.productName}-${var.env}"
    Type = "VPC module"
  }
}