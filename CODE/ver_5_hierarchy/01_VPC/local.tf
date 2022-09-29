locals {
  all_subnets = flatten([
    for key, value in var.subnets : [
      for item in value.cidr : {
        name = key
        cidr = item
      }
    ]
  ])
}

locals {
  public_subnets = flatten([
    for key, value in var.subnets : [
      for item in value.cidr : {
        name = key
        cidr = item
      }
    ] if value.type == "public"
  ])
}

locals {
  private_subnets = flatten([
    for key, value in var.subnets : [
      for item in value.cidr : {
        name  = key
        cidr  = item
        natgw = value.natgw
      }
    ] if value.type == "private"
  ])
}