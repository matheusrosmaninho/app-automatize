resource "aws_key_pair" "infra_key_app" {
  key_name   = "app-${var.appName}"
  public_key = var.ec2PublicKey
}

resource "aws_instance" "infra_ec2_app" {
  ami = var.ec2Ami
  instance_type = var.ec2InstanceType
  subnet_id = aws_subnet.infra_subnet_app.id
  associate_public_ip_address = true
  key_name = aws_key_pair.infra_key_app.key_name
  security_groups = [ aws_security_group.infra_sg_app.id ]
  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  disable_api_termination = false
  disable_api_stop = false

  depends_on = [
    aws_key_pair.infra_key_app,
    aws_subnet.infra_subnet_app,
    aws_security_group.infra_sg_app
   ]
}

resource "aws_eip" "infra_ec2_eip_app" {
  instance = aws_instance.infra_ec2_app.id
  domain   = "vpc"

  depends_on = [ aws_instance.infra_ec2_app ]
}