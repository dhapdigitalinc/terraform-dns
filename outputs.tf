output "dns_zone_id" {
  value = "${aws_route53_zone.route53_zone_local.zone_id}"
}
