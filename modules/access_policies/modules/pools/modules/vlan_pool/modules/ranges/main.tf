terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_ranges" "range" {
  vlan_pool_dn  = var.pool_dn
  description   = var.range.description
  from          = format("vlan-%d", var.range.from) #"vlan-1"
  to            = format("vlan-%d", var.range.to) #"vlan-2"
  alloc_mode    = var.range.alloc_mode
  annotation    = var.range.annotation
  name_alias    = var.range.name_alias
  role          = var.range.role
}
