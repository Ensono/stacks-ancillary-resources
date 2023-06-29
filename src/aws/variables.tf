############################################
# NAMING
############################################

variable "name_company" {
  type    = string
  default = "ensono"
}

variable "name_project" {
  type    = string
  default = "stacks"
}

variable "name_component" {
  type    = string
  default = "ancillary"
}

variable "name_environment" {
  type    = string
  default = "nonprod"
}

# Each region must have corresponding a shortend name for resource naming purposes
variable "location_name_map" {
  type = map(string)

  default = {
    eu-west-2 = "ew2"
    eu-west-1 = "ew1"
    eu-west-3 = "ew3"
  }
}

variable "region" {

  description = "Name of the AWS Region for Deployment."
  type        = string
  default     = "eu-west-2"
}


########################################
## Terraform State S3 Bucket
########################################
variable "acl" {
  description = "The canned ACL to apply."
  type        = string
  default     = "private"
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = string
  default     = false
}

variable "versioning_enabled" {
  description = "Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state."
  type        = string
  default     = true
}

## s3 bucket public access block ##
variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = string
  default     = true
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = string
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = string
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = string
  default     = true
}

########################################
## DynamoDB
########################################
variable "read_capacity" {
  description = "The number of read units for this table."
  type        = string
  default     = 5
}

variable "write_capacity" {
  description = "The number of write units for this table."
  type        = string
  default     = 5
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key."
  type        = string
  default     = "LockID"
}

variable "attribute_name" {
  description = "Attribute Name"
  type        = string
  default     = "LockID"
}
variable "attribute_type" {
  description = "Attribute Type"
  type        = string
  default     = "S"
}

variable "sse_enabled" {
  description = "Encryption at rest using an AWS managed Customer Master Key. If enabled is false then server-side encryption is set to AWS owned CMK (shown as DEFAULT in the AWS console). If enabled is true then server-side encryption is set to AWS managed CMK (shown as KMS in the AWS console). ."
  type        = string
  default     = true
}