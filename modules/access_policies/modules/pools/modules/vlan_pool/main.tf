terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

locals {
  vlan_pool = defaults(var.vlan_pool, {
    use_existing  = false
  })
}

### Optionaly load exising VLAN pool ###
data "aci_vlan_pool" "pool" {
  count = local.vlan_pool.use_existing == true ? 1 : 0

  name        = local.vlan_pool.name
  alloc_mode  = local.vlan_pool.alloc_mode # (Required) Allocation mode for object vlan_pool. Allowed values: "dynamic", "static"
}

### Build new VLAN pool ###
resource "aci_vlan_pool" "pool" {
  count   = local.vlan_pool.use_existing == false ? 1 : 0

  name        = local.vlan_pool.name
  description = local.vlan_pool.description
  alloc_mode  = local.vlan_pool.alloc_mode # Allocation mode for object vlan_pool. Allowed values: "dynamic", "static"
  annotation  = local.vlan_pool.annotation
  name_alias  = local.vlan_pool.name_alias
}

module "ranges" {
  for_each  = local.vlan_pool.ranges
  source    = "./modules/ranges"

  ### VARIABLES ###
  pool_dn = local.vlan_pool.use_existing == true ? data.aci_vlan_pool.pool[0].id : aci_vlan_pool.pool[0].id
  range   = each.value
}
