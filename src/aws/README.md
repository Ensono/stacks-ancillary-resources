## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 0.14)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 4.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 2)

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_default_label"></a> [default\_label](#module\_default\_label)

Source: git::https://github.com/cloudposse/terraform-null-label.git

Version: 0.24.1

### <a name="module_terraform_remote_backend"></a> [terraform\_remote\_backend](#module\_terraform\_remote\_backend)

Source: git::https://github.com/amido/stacks-terraform//aws/modules/infrastructure_modules/terraform_remote_backend

Version: 1.5.5

## Resources

No resources.

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_acl"></a> [acl](#input\_acl)

Description: The canned ACL to apply.

Type: `string`

Default: `"private"`

### <a name="input_attribute_name"></a> [attribute\_name](#input\_attribute\_name)

Description: Attribute Name

Type: `string`

Default: `"LockID"`

### <a name="input_attribute_type"></a> [attribute\_type](#input\_attribute\_type)

Description: Attribute Type

Type: `string`

Default: `"S"`

### <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls)

Description: Whether Amazon S3 should ignore public ACLs for this bucket.

Type: `string`

Default: `true`

### <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy)

Description: Whether Amazon S3 should block public bucket policies for this bucket.

Type: `string`

Default: `true`

### <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy)

Description: A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable.

Type: `string`

Default: `false`

### <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key)

Description: The attribute to use as the hash (partition) key.

Type: `string`

Default: `"LockID"`

### <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls)

Description: Whether Amazon S3 should ignore public ACLs for this bucket.

Type: `string`

Default: `true`

### <a name="input_location_name_map"></a> [location\_name\_map](#input\_location\_name\_map)

Description: Each region must have corresponding a shortend name for resource naming purposes

Type: `map(string)`

Default:

```json
{
  "eu-west-1": "ew1",
  "eu-west-2": "ew2",
  "eu-west-3": "ew3"
}
```

### <a name="input_name_company"></a> [name\_company](#input\_name\_company)

Description: n/a

Type: `string`

Default: `"ensono"`

### <a name="input_name_component"></a> [name\_component](#input\_name\_component)

Description: n/a

Type: `string`

Default: `"ancillary"`

### <a name="input_name_environment"></a> [name\_environment](#input\_name\_environment)

Description: n/a

Type: `string`

Default: `"nonprod"`

### <a name="input_name_project"></a> [name\_project](#input\_name\_project)

Description: n/a

Type: `string`

Default: `"stacks"`

### <a name="input_read_capacity"></a> [read\_capacity](#input\_read\_capacity)

Description: The number of read units for this table.

Type: `string`

Default: `5`

### <a name="input_region"></a> [region](#input\_region)

Description: Name of the AWS Region for Deployment.

Type: `string`

Default: `"eu-west-2"`

### <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets)

Description: Whether Amazon S3 should restrict public bucket policies for this bucket.

Type: `string`

Default: `true`

### <a name="input_sse_enabled"></a> [sse\_enabled](#input\_sse\_enabled)

Description: Encryption at rest using an AWS managed Customer Master Key. If enabled is false then server-side encryption is set to AWS owned CMK (shown as DEFAULT in the AWS console). If enabled is true then server-side encryption is set to AWS managed CMK (shown as KMS in the AWS console). .

Type: `string`

Default: `true`

### <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled)

Description: Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state.

Type: `string`

Default: `true`

### <a name="input_write_capacity"></a> [write\_capacity](#input\_write\_capacity)

Description: The number of write units for this table.

Type: `string`

Default: `5`

## Outputs

The following outputs are exported:

### <a name="output_dynamodb_terraform_state_lock_arn"></a> [dynamodb\_terraform\_state\_lock\_arn](#output\_dynamodb\_terraform\_state\_lock\_arn)

Description: The arn of the table

### <a name="output_dynamodb_terraform_state_lock_id"></a> [dynamodb\_terraform\_state\_lock\_id](#output\_dynamodb\_terraform\_state\_lock\_id)

Description: The name of the table

### <a name="output_s3_kms_terraform_backend_alias_arn"></a> [s3\_kms\_terraform\_backend\_alias\_arn](#output\_s3\_kms\_terraform\_backend\_alias\_arn)

Description: The Amazon Resource Name (ARN) of the key alias.

### <a name="output_s3_kms_terraform_backend_arn"></a> [s3\_kms\_terraform\_backend\_arn](#output\_s3\_kms\_terraform\_backend\_arn)

Description: The Amazon Resource Name (ARN) of the key.

### <a name="output_s3_kms_terraform_backend_id"></a> [s3\_kms\_terraform\_backend\_id](#output\_s3\_kms\_terraform\_backend\_id)

Description: The globally unique identifier for the key.

### <a name="output_s3_terraform_remote_backend_arn"></a> [s3\_terraform\_remote\_backend\_arn](#output\_s3\_terraform\_remote\_backend\_arn)

Description: The arn of the table

### <a name="output_s3_terraform_remote_backend_id"></a> [s3\_terraform\_remote\_backend\_id](#output\_s3\_terraform\_remote\_backend\_id)

Description: The name of the table
