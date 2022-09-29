locals {
  all_sg = flatten([
    for key in var.sg_name : {
      name = key
    }
  ])
}

# locals {
#   all_rules = flatten([
#     for key, value in var.rules : {
#       name                        = key
#       sg_name                     = value.sg_name
#       security_group_id           = value.security_group_id
#       type                        = value.type
#       from_port                   = value.from_port
#       to_port                     = value.to_port
#       protocol                    = value.protocol\
#       cidr_blocks                 = value.cidr_blocks
#       source_security_group_id    = value.source_security_group_id
#       ipv6_cidr_blocks            = value.ipv6_cidr_blocks
#       prefix_list_ids             = value.prefix_list_ids
#       self                        = value.self
#       description                 = value.description
#     }
#     if (( 0 < length(value.cidr_blocks)  || 0 < length(value.ipv6_cidr_blocks) || 0 < length(value.prefix_list_ids)) && false == value.self )
#   ])
# }

# Rule source - CIDR / ingress
locals {
  cidr_ingress_rules = flatten([
    for key, value in var.rules : {
      name                        = key
      sg_name                     = value.sg_name
      type                        = value.type
      from_port                   = value.from_port
      to_port                     = value.to_port
      protocol                    = value.protocol
      cidr_blocks                 = value.cidr_blocks
      ipv6_cidr_blocks            = value.ipv6_cidr_blocks
      prefix_list_ids             = value.prefix_list_ids
      description                 = value.description  
    }
    if (( 0 < length(value.cidr_blocks)  || 0 < length(value.ipv6_cidr_blocks) || 0 < length(value.prefix_list_ids)) && false == value.self && "ingress" == value.type )
  ])
}
# Rule source - CIDR / egress
locals {
  cidr_egress_rules = flatten([
    for key, value in var.rules : {
      name                        = key
      sg_name                     = value.sg_name
      type                        = value.type
      from_port                   = value.from_port
      to_port                     = value.to_port
      protocol                    = value.protocol
      cidr_blocks                 = value.cidr_blocks
      ipv6_cidr_blocks            = value.ipv6_cidr_blocks
      prefix_list_ids             = value.prefix_list_ids
      description                 = value.description  
    }
    if (( 0 < length(value.cidr_blocks)  || 0 < length(value.ipv6_cidr_blocks) || 0 < length(value.prefix_list_ids)) && false == value.self && "egress" == value.type )
  ])
}


# Rule source - self / ingress
locals {
   self_ingress_rules = flatten([
    for key, value in var.rules : {
      name                        = key
      sg_name                     = value.sg_name
      type                        = value.type
      from_port                   = value.from_port
      to_port                     = value.to_port
      protocol                    = value.protocol
      prefix_list_ids             = value.prefix_list_ids
      description                 = value.description
      self                        = value.self  
    } 
    if ( true == value.self && "ingress" == value.type )
   ])
}
# Rule source - self / egress
locals {
   self_egress_rules = flatten([
    for key, value in var.rules : {
      name                        = key
      sg_name                     = value.sg_name
      type                        = value.type
      from_port                   = value.from_port
      to_port                     = value.to_port
      protocol                    = value.protocol
      prefix_list_ids             = value.prefix_list_ids
      description                 = value.description  
      self                        = value.self 
    } 
    if ( true == value.self && "egress" == value.type )
   ])
}


# Rule source - sg / ingress
locals {
    sg_ingress_rules = flatten([
    for key, value in var.rules : {
        name                        = key
        sg_name                     = value.sg_name
        type                        = value.type
        from_port                   = value.from_port
        to_port                     = value.to_port
        protocol                    = value.protocol
        source_security_group_id    = value.source_security_group_id
        prefix_list_ids             = value.prefix_list_ids
        description                 = value.description
    }
    if ( "" != value.source_security_group_id  && false == value.self && "ingress" == value.type )
    ]) 
}
# Rule source - sg / egress
locals {
    sg_egress_rules = flatten([
    for key, value in var.rules : {
        name                        = key
        sg_name                     = value.sg_name
        type                        = value.type
        from_port                   = value.from_port
        to_port                     = value.to_port
        protocol                    = value.protocol
        source_security_group_id    = value.source_security_group_id
        prefix_list_ids             = value.prefix_list_ids
        description                 = value.description
    }
    if ( "" != value.source_security_group_id  && false == value.self && "egress" == value.type )
    ]) 
}