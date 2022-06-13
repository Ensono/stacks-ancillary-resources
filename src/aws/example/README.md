##

N.B: There are two tfvars file present, when creating infrastructure for particular environment, please disable the other tfvars file by renaming like below:

```
mv terraform.prod.tfvars terraform.prod.tfvars.disable
mv terraform.prod.tfstate terraform.prod.tfstate.disable
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.28, < 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.28, < 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_remote_backend"></a> [terraform\_remote\_backend](#module\_terraform\_remote\_backend) | git::https://github.com/amido/stacks-terraform//aws/modules/infrastructure_modules/terraform_remote_backend | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | The canned ACL to apply. | `string` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the application. | `string` | n/a | yes |
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of the application used in tagging. | `string` | n/a | yes |
| <a name="input_attribute_name"></a> [attribute\_name](#input\_attribute\_name) | n/a | `any` | n/a | yes |
| <a name="input_attribute_type"></a> [attribute\_type](#input\_attribute\_type) | n/a | `any` | n/a | yes |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `string` | n/a | yes |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The name of the environment. | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `string` | n/a | yes |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | The attribute to use as the hash (partition) key. | `string` | n/a | yes |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `string` | n/a | yes |
| <a name="input_read_capacity"></a> [read\_capacity](#input\_read\_capacity) | The number of read units for this table. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. | `string` | n/a | yes |
| <a name="input_sse_enabled"></a> [sse\_enabled](#input\_sse\_enabled) | Encryption at rest using an AWS managed Customer Master Key. If enabled is false then server-side encryption is set to AWS owned CMK (shown as DEFAULT in the AWS console). If enabled is true then server-side encryption is set to AWS managed CMK (shown as KMS in the AWS console). . | `string` | n/a | yes |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. | `string` | n/a | yes |
| <a name="input_write_capacity"></a> [write\_capacity](#input\_write\_capacity) | The number of write units for this table. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamodb_terraform_state_lock_arn"></a> [dynamodb\_terraform\_state\_lock\_arn](#output\_dynamodb\_terraform\_state\_lock\_arn) | The arn of the table |
| <a name="output_dynamodb_terraform_state_lock_id"></a> [dynamodb\_terraform\_state\_lock\_id](#output\_dynamodb\_terraform\_state\_lock\_id) | The name of the table |
| <a name="output_s3_kms_terraform_backend_alias_arn"></a> [s3\_kms\_terraform\_backend\_alias\_arn](#output\_s3\_kms\_terraform\_backend\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias. |
| <a name="output_s3_kms_terraform_backend_arn"></a> [s3\_kms\_terraform\_backend\_arn](#output\_s3\_kms\_terraform\_backend\_arn) | The Amazon Resource Name (ARN) of the key. |
| <a name="output_s3_kms_terraform_backend_id"></a> [s3\_kms\_terraform\_backend\_id](#output\_s3\_kms\_terraform\_backend\_id) | The globally unique identifier for the key. |
| <a name="output_s3_terraform_remote_backend_arn"></a> [s3\_terraform\_remote\_backend\_arn](#output\_s3\_terraform\_remote\_backend\_arn) | The arn of the table |
| <a name="output_s3_terraform_remote_backend_id"></a> [s3\_terraform\_remote\_backend\_id](#output\_s3\_terraform\_remote\_backend\_id) | The name of the table |
