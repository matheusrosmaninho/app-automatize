resource "cloudflare_record" "infra_ec2_app_domain" {
  zone_id = var.cloudflareZoneId
  name    = "app.${var.domain}"
  value   = aws_eip.infra_ec2_eip_app.public_ip
  type    = "A"
  proxied = true
  comment = "${var.appName}-${var.productName}-${var.env}"

  depends_on = [
    aws_eip.infra_ec2_eip_app,
    aws_instance.infra_ec2_app
  ]
}
