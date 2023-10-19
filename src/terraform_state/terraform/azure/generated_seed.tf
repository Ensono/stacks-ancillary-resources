# Generates a seed value that can be applied to resources to help ensure
# that a resource name is unique

resource "random_string" "generated_seed" {
  length  = 5
  special = false
  upper   = false
}
