variable "dhap_com_dns_zone_id" {
  type    = "string"
  default = "Z9DTKRN5O1P8Z"
}

variable "environment" {
  type        = "string"
  description = "dhap environment identifier "
}

variable "vpc_id" {
  type        = "string"
  description = "ID of the VPC that will contain local Route53 zone and resources."
}

variable "dns_zone_name" {
  type        = "string"
  description = "Register local VPC resources in what Route53 zone"
  default     = "dhap"
}

variable "dns_record_ttl" {
  type        = "string"
  description = "Time to Live (TTL) for dns records created in Route53"
  default     = "300"
}

variable "mongo_hosts" {
  type        = "list"
  description = "List of Mongo endpoints for this VPC"
  default     = []
}

variable "internal_services" {
  type    = "list"
  default = []
}

variable "public_services" {
  type    = "list"
  default = []
}

variable "adm_dns_zone_id" {
  type        = "string"
  description = "Register this RDS instance in what Route53 admin zone for the region"
  default     = ""
}

variable "alb_internal_dns_name" {
  type    = "string"
  default = ""
}

variable "alb_public_dns_name" {
  type    = "string"
  default = ""
}

variable "memcache_nodes" {
  description = "Number of Memcache nodes in the cluster."
  default     = 0
}

variable "memcache_endpoint" {
  type    = "string"
  default = ""
}

variable "memcache_configuration_endpoint_address" {
  type    = "string"
  default = ""
}

variable "rds_db_instance_address" {
  type    = "string"
  default = ""
}

variable "rds_instance_identifier" {
  type    = "string"
  default = ""
}
