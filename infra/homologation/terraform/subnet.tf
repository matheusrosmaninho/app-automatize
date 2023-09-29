resource "aws_subnet" "infra_subnet_app" {
  vpc_id     = module.vpc.vpc_id
  cidr_block = "${var.prefixCidr}.104.0/24"

  depends_on = [module.vpc]
}

resource "aws_route_table_association" "infra_route_app" {
  subnet_id      = aws_subnet.infra_subnet_app.id
  route_table_id = module.vpc.public_route_table_ids[0]

  depends_on = [
    aws_subnet.infra_subnet_app,
    module.vpc
  ]
}
