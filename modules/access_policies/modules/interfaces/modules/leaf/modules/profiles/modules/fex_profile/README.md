<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >=2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >=2.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_access_port_selector"></a> [access\_port\_selector](#module\_access\_port\_selector) | ./modules/access_port_selector | n/a |

## Resources

| Name | Type |
|------|------|
| [aci_fex_profile.profile](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/fex_profile) | resource |
| [aci_fex_profile.profile](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/fex_profile) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fex_profile"></a> [fex\_profile](#input\_fex\_profile) | n/a | <pre>object({<br>    name          = string # (Required) The FEX profile name.<br>    use_existing  = optional(bool)<br>    annotation    = optional(string) # (Optional) Specifies the annotation of the FEX profile name.<br>    description   = optional(string) # (Optional) Specifies the description of the FEX profile name.<br>    name_alias    = optional(string) # (Optional) Specifies the alias name of the FEX profile name.<br>    port_selectors = map(object({<br>      name                      = string # (Required) Name of Object Access Port Selector.<br>      use_existing              = optional(bool)<br>      access_port_selector_type = string # (Required) The host port selector type. Allowed values are "ALL" and "range". Default is "ALL".<br>      annotation                = optional(string) # (Optional) Annotation for object Access Port Selector.<br>      description               = optional(string) # (Optional) Description for object Access Port Selector.<br>      name_alias                = optional(string) # (Optional) Name alias for object Access Port Selector.<br>      policy_group              = object({<br>        use_existing = optional(bool)<br>        name = optional(string) # Interface Policy Group Name<br>        type = optional(string) # "port", "bundle"<br>      })<br>      port_blocks = map(object({<br>        name        = string # (Optional) name of Object Access Port Block.<br>        annotation  = optional(string) # (Optional) Annotation for object Access Port Block.<br>        description = optional(string) # (Optional) Description for object Access Port Block.<br>        from_card   = number # (Optional) The beginning (from-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".<br>        from_port   = number # (Optional) The beginning (from-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".<br>        name_alias  = optional(string) # (Optional) Name alias for object Access Port Block.<br>        to_card     = number # (Optional) The end (to-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".<br>        to_port     = number # (Optional) The end (to-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".<br>      }))<br>      sub_port_blocks = map(object({<br>        name          = string # (Required) Name of Object access sub port block.<br>        annotation    = optional(string) # (Optional) Annotation for object access sub port block.<br>        description   = optional(string) # (Optional) Description for object access sub port block.<br>        from_card     = number # (Optional) From card. Allowed Values are between 1 to 100. Default Value is "1".<br>        from_port     = number # (Optional) Port block from port Allowed Values are between 1 to 127. Default Value is "1".<br>        from_sub_port = number # (Optional) From sub port for object access sub port block. Allowed Values are between 1 to 64. Default Value is "1".<br>        name_alias    = optional(string) # (Optional) Name alias for object access sub port block.<br>        to_card       = number # (Optional) To card. Allowed Values are between 1 to 100. Default Value is "1".<br>        to_port       = number # (Optional) To port. Allowed Values are between 1 to 127. Default Value is "1".<br>        to_sub_port   = number # (Optional) To sub port for object access sub port block. Allowed Values are between 1 to 64. Default Value is "1".<br>      }))<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_interface_policy_group_map"></a> [interface\_policy\_group\_map](#input\_interface\_policy\_group\_map) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_profile_id"></a> [profile\_id](#output\_profile\_id) | n/a |
<!-- END_TF_DOCS -->