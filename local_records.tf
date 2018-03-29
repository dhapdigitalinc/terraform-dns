# DNS records for local zone
# No records for items where source not provided

resource "aws_route53_record" "alb_internal_dns" {
  count   = "${length(var.internal_services)}"

  zone_id = "${aws_route53_zone.route53_zone_local.zone_id}"
  name    = "${element(var.internal_services, count.index)}"

  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.alb_internal_dns_name}"]
}

resource "aws_route53_record" "alb_internal_dns_canary" {
  count   = "${length(var.internal_services)}"

  zone_id = "${aws_route53_zone.route53_zone_local.zone_id}"
  name    = "${element(var.internal_services, count.index)}-canary"

  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.alb_internal_dns_name}"]
}

resource "aws_route53_record" "alb_public_dns" {
  count   = "${length(var.public_services)}"

  zone_id = "${aws_route53_zone.route53_zone_local.zone_id}"
  name    = "${element(var.public_services, count.index)}"

  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.alb_public_dns_name}"]
}

resource "aws_route53_record" "memcache_nodes" {
  count   = "${var.memcache_nodes}"

  zone_id = "${aws_route53_zone.route53_zone_local.zone_id}"
  name    = "memcache${count.index + 1}"
  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.environment}.${element(split(".", var.memcache_endpoint), 1)}.000${count.index + 1}.${element(split(".", var.memcache_endpoint), 3)}.cache.amazonaws.com"]
  #  records = ["${element(aws_elasticache_cluster.memcache.cache_nodes.*.address, count.index)}"]
}

resource "aws_route53_record" "memcache" {
  count   = "${var.memcache_configuration_endpoint_address != "" ? 1 : 0}"

  zone_id = "${aws_route53_zone.route53_zone_local.zone_id}"
  name    = "memcache"
  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.memcache_configuration_endpoint_address}"]
}

resource "aws_route53_record" "mysql" {
  count   = "${var.rds_db_instance_address != "" ? 1 : 0}"

  zone_id = "${aws_route53_zone.route53_zone_local.zone_id}"
  name    = "mysql"
  type    = "CNAME"
  ttl     = "${var.dns_record_ttl}"

  records = [
    "${var.rds_db_instance_address}"]
}

