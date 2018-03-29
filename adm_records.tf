# DNS records for ADM zone
# No records if ADM zone ID not provided or for items where source not provided

resource "aws_route53_record" "alb_internal_adm_dns" {
  count   = "${var.adm_dns_zone_id != "" ? length(var.internal_services) : 0}"

  zone_id = "${var.adm_dns_zone_id}"
  name    = "${element(var.internal_services, count.index)}.${var.environment}"
  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.alb_internal_dns_name}"]
}

resource "aws_route53_record" "alb_internal_adm_dns_canary" {
  count   = "${var.adm_dns_zone_id != "" ? length(var.internal_services) : 0}"

  zone_id = "${var.adm_dns_zone_id}"
  name    = "${element(var.internal_services, count.index)}-canary.${var.environment}"
  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.alb_internal_dns_name}"]
}

resource "aws_route53_record" "alb_public_adm_dns" {
  count   = "${var.adm_dns_zone_id != "" ? length(var.public_services) : 0}"

  zone_id = "${var.adm_dns_zone_id}"
  name    = "${element(var.public_services, count.index)}.${var.environment}"
  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.alb_public_dns_name}"]
}

resource "aws_route53_record" "alb_public_adm_dns_canary" {
  count   = "${var.adm_dns_zone_id != "" ? length(var.public_services) : 0}"

  zone_id = "${var.adm_dns_zone_id}"
  name    = "${element(var.public_services, count.index)}-canary.${var.environment}"
  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.alb_public_dns_name}"]
}

resource "aws_route53_record" "memcache_adm" {
  count   = "${var.adm_dns_zone_id != "" && var.memcache_configuration_endpoint_address != "" ? 1 : 0}"

  zone_id = "${var.adm_dns_zone_id}"
  name    = "memcache.${var.environment}"
  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.memcache_configuration_endpoint_address}"]
}

resource "aws_route53_record" "mysql_adm" {
  count   = "${var.adm_dns_zone_id != "" && var.rds_db_instance_address != "" ? 1 : 0}"

  zone_id = "${var.adm_dns_zone_id}"
  name    = "mysql.${var.rds_instance_identifier}"
  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.rds_db_instance_address}"]
}


