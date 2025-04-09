output "dns_hostname" {
  description = "Simulated DNS hostname (not a real Route53 record)"
  value       = module.route53.fake_dns_name
}
