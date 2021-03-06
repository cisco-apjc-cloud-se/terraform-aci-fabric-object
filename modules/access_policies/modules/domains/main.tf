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
  ### Domain Name => ID Map ###
  domain_map = merge({
    for k,d in var.domains.physical_domains :
      k => {
        name = d.name
        type = "physical"
        id = module.physical_domains[k].domain_id
      }
  },
  {
    for k,d in var.domains.l3_domains :
      k => {
        name = d.name
        type = "layer3"
        id = module.l3_domains[k].domain_id
      }
  },
  {
    for k,d in var.domains.fc_domains :
      k => {
        name = d.name
        type = "fc"
        id = module.fc_domains[k].domain_id
      }
  }
  )
}

### ACI Fabric Access Policy - Physical Domain Module ###
module "physical_domains" {
  for_each = var.domains.physical_domains
  source = "./modules/physical_domains"

  ### Variables ###
  physical_domain = each.value
  vlan_pool_map   = var.vlan_pool_map
}

### ACI Fabric Access Policy - Layer 3 Domain Module ###
module "l3_domains" {
  for_each = var.domains.l3_domains
  source = "./modules/layer3_domains"

  ### Variables ###
  l3_domain       = each.value
  vlan_pool_map   = var.vlan_pool_map
}

### ACI Fabric Access Policy - FC Domain Module ###
module "fc_domains" {
  for_each = var.domains.fc_domains
  source = "./modules/fc_domains"

  ### Variables ###
  fc_domain       = each.value
  vlan_pool_map   = var.vlan_pool_map
  vsan_pool_map   = var.vsan_pool_map
}
