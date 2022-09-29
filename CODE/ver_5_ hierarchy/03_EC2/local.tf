locals {
  eip_instance = flatten([
    for key, value in var.add_instance : {
      name              = key
      eip               = value.eip
      instance_name     = value.instance_name
      availability_zone = value.availability_zone
    }
    if(true == value.eip)
  ])
}

locals {
  all_instance = flatten([
    for key, value in var.add_instance : {
      name              = key
      instance_name     = value.instance_name
      availability_zone = value.availability_zone
      instance_type     = value.instance_type
      key_name          = value.key_name
      security_groups   = value.security_groups
      subnet_id         = value.subnet_id
      volume_size       = value.volume_size
      volume_type       = value.volume_type
    }
  ])
}