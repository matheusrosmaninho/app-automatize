resource "aws_security_group" "infra_sg_app" {
  name   = "app-sg"
  vpc_id = module.vpc.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  depends_on = [module.vpc]

  tags = {
    Name = "App"
    Type = "Security group"
  }
}
