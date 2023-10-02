resource "cloudflare_ruleset" "infra_app_waf_custom_rules" {
  account_id = var.cloudflareAccountId
  name = "Waf custom rules"
  description = "Waf custom rules"
  kind = "zone"
  phase = "http_request_firewall_custom"

  # Block countries of malicious attack
  rules {
    action = "block"
    expression = "(ip.geoip.country in {\"CN\" \"IR\" \"RU\"})"
    description = "Block countries of malicious attack"
    enabled = true
  }
}