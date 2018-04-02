resource "aws_route53_record" "alb_public_dhap_com_dns" {
  #  count   = "${var.dns_zone_id != "" ? 1 : 0}"
  count = "${length(var.public_services)}"

  zone_id = "${var.dhap_com_dns_zone_id}"
  name    = "${element(var.public_services, count.index)}-${var.environment}"

  type = "CNAME"
  ttl  = "${var.dns_record_ttl}"

  records = [
    "${var.alb_public_dns_name}",
  ]
}

resource "aws_route53_record" "alb_public_dhap_com_dns_canary" {
  #  count   = "${var.dns_zone_id != "" ? 1 : 0}"
  count = "${length(var.public_services)}"

  zone_id = "${var.dhap_com_dns_zone_id}"
  name    = "${element(var.public_services, count.index)}-canary-${var.environment}"

  type = "CNAME"
  ttl  = "${var.dns_record_ttl}"

  records = [
    "${var.alb_public_dns_name}",
  ]
}
