variable "automation_connection_certificates" {
  description = <<EOT
Map of automation_connection_certificates, attributes below
Required:
    - automation_account_name
    - automation_certificate_name
    - name
    - resource_group_name
    - subscription_id
Optional:
    - description
EOT

  type = map(object({
    automation_account_name     = string
    automation_certificate_name = string
    name                        = string
    resource_group_name         = string
    subscription_id             = string
    description                 = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_certificates : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_certificates : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_certificates : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_certificates : (
        length(v.automation_certificate_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_certificates : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.subscription_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

