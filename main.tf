# Create Route53 local zone for VPC
resource "aws_route53_zone" "route53_zone_local" {
  name    = "${var.dns_zone_name}.local"
  vpc_id  = "${var.vpc_id}"
  comment = "${var.dns_zone_name}.local for ${var.environment}"
}
