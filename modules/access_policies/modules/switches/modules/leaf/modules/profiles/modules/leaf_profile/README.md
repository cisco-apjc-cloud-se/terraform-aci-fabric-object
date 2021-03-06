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
| <a name="module_leaf_selector"></a> [leaf\_selector](#module\_leaf\_selector) | ./modules/leaf_selector | n/a |

## Resources

| Name | Type |
|------|------|
| [aci_leaf_profile.profile](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/leaf_profile) | resource |
| [aci_fex_profile.profile](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/fex_profile) | data source |
| [aci_leaf_interface_profile.profile](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/leaf_interface_profile) | data source |
| [aci_leaf_profile.profile](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/leaf_profile) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_interface_profile_map"></a> [interface\_profile\_map](#input\_interface\_profile\_map) | n/a | `any` | n/a | yes |
| <a name="input_leaf_profile"></a> [leaf\_profile](#input\_leaf\_profile) | n/a | <pre>object({<br>    name                = string # (Required) Name of Object leaf profile.<br>    use_existing        = optional(bool)<br>    description         = optional(string) # (Optional) Description for object leaf profile.<br>    annotation          = optional(string) # (Optional) Annotation for object leaf profile.<br>    name_alias          = optional(string) # (Optional) Name alias for object leaf profile.<br>    interface_profiles  = map(object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>      type          = optional(string) # "leaf_interface_profile", "fex_profile"<br>    }))<br>    leaf_selectors  = map(object({<br>      name                    = string # (Required) Name of Object switch association.<br>      use_existing            = optional(bool)<br>      switch_association_type = string # (Required) The leaf selector type. Allowed values: "ALL", "range", "ALL_IN_POD".<br>      annotation              = optional(string) # (Optional) Annotation for object switch association.<br>      description             = optional(string) # (Optional) Description for object switch association.<br>      name_alias              = optional(string) # (Optional) Name alias for object switch association.<br>      policy_group            = object({<br>        use_existing  = optional(bool)<br>        name          = optional(string)<br>        })<br>      node_blocks = map(object({<br>        name        = string # (Required) Name of Object node block.<br>        annotation  = optional(string) # (Optional) Annotation for object node block.<br>        description = optional(string) # (Optional) Description for object node block.<br>        from_node   = number # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".<br>        name_alias  = optional(string) # (Optional) Name alias for object node block.<br>        to_node     = number # (Optional) To node ID. Range from 1 to 16000. Default value is "1".<br>      }))<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_switch_policy_group_map"></a> [switch\_policy\_group\_map](#input\_switch\_policy\_group\_map) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->