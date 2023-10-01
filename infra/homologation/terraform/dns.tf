resource "cloudflare_record" "infra_ec2_app_domain" {
  zone_id = var.zoneId
  name    = "app"
  value   = aws_eip.infra_ec2_eip_app.public_ip
  type    = "A"
  proxied = false

  depends_on = [
    aws_eip.infra_ec2_eip_app,
    aws_instance.infra_ec2_app
  ]
}
