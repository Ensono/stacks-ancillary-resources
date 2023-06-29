# Naming convention
module "default_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"
  namespace   = format("%s-%s", var.name_company, var.name_project)
  environment = var.name_environment
  name        = "${lookup(var.location_name_map, var.region, "eu-west-2")}-${var.name_component}"
  delimiter   = "-"
  tags        = local.default_tags
}

########################################
# AWS Terraform backend composition
########################################

module "terraform_remote_backend" {

  source = "git::https://github.com/amido/stacks-terraform//aws/modules/infrastructure_modules/terraform_remote_backend?ref=v1.5.5"

  env      = var.name_environment
  app_name = var.name_component
  region   = var.region
  tags     = local.default_tags

  ########################################
  ## Terraform State S3 Bucket
  ########################################
  acl                = var.acl # infra's input var = composition's input var, coming from .tfvars
  force_destroy      = var.force_destroy
  versioning_enabled = var.versioning_enabled

  ## s3 bucket public access block ##
  block_public_policy     = var.block_public_policy
  block_public_acls       = var.block_public_acls
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  ########################################
  ## DynamoDB
  ########################################
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  attribute_name = var.attribute_name
  attribute_type = var.attribute_type
  sse_enabled    = var.sse_enabled
}
