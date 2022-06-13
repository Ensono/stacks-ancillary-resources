###########################################################################################
# Info:
# This file contains value which corresponds to Production Environement
# Separate bucket for different stage is choosen because of the bucket name consist env name
############################################################################################


########################################
# General and Bucket Name Settings
########################################
region           = "eu-west-2"
application_name = "eks-infra"
app_name         = "eks-infra"
env              = "prod"

########################################
## Terraform State S3 Bucket
########################################
acl                = "private"
force_destroy      = false
versioning_enabled = true

# Blocking Public Access
block_public_policy     = true
block_public_acls       = true
ignore_public_acls      = true
restrict_public_buckets = true

########################################
## DynamoDB
########################################
read_capacity  = 5
write_capacity = 5
hash_key       = "LockID" # state locking
sse_enabled    = true     # enable server side encryption
attribute_name = "LockID"
attribute_type = "S"
