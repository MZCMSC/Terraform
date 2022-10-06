# Rule source - CIDR / ingress
resource "aws_security_group_rule" "cidr_ingress" {
    for_each          = { for i in local.cidr_ingress_rules : i.name => i }
    
    security_group_id = aws_security_group.this[each.value.sg_name].id
    type              = each.value.type
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    cidr_blocks       = each.value.cidr_blocks
    ipv6_cidr_blocks  = each.value.ipv6_cidr_blocks
    protocol          = each.value.protocol
    prefix_list_ids   = each.value.prefix_list_ids
    description       = each.value.description

    depends_on = [aws_security_group.this]
}

# Rule source - CIDR / egress
resource "aws_security_group_rule" "cidr_egress" {
    for_each          = { for i in local.cidr_egress_rules : i.name => i }
    
    security_group_id = aws_security_group.this[each.value.sg_name].id
    type              = each.value.type
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    cidr_blocks       = each.value.cidr_blocks
    ipv6_cidr_blocks  = each.value.ipv6_cidr_blocks
    protocol          = each.value.protocol
    prefix_list_ids   = each.value.prefix_list_ids
    description       = each.value.description

    depends_on = [aws_security_group.this]
}

# Rule source - self / ingress
resource "aws_security_group_rule" "self_ingress" {
    for_each          = { for i in local.self_ingress_rules : i.name => i }
    
    security_group_id = aws_security_group.this[each.value.sg_name].id
    type              = each.value.type
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    protocol          = each.value.protocol
    prefix_list_ids   = each.value.prefix_list_ids
    description       = each.value.description
    self              = each.value.self 
    
    depends_on = [aws_security_group.this] 
}

# Rule source - self / egress
resource "aws_security_group_rule" "self_egress" {
    for_each          = { for i in local.self_egress_rules : i.name => i }

    security_group_id = aws_security_group.this[each.value.sg_name].id
    type              = each.value.type
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    protocol          = each.value.protocol
    prefix_list_ids   = each.value.prefix_list_ids
    description       = each.value.description
    self              = each.value.self 
    
    depends_on = [aws_security_group.this]
}

# Rule source - sg / ingress
resource "aws_security_group_rule" "security_group_id_ingress" {
    for_each          = { for i in local.sg_ingress_rules : i.name => i}
    
    security_group_id = aws_security_group.this[each.value.sg_name].id
    type              = each.value.type
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    protocol          = each.value.protocol
    source_security_group_id = each.value.source_security_group_id
    prefix_list_ids   = each.value.prefix_list_ids
    description       = each.value.description

    depends_on = [aws_security_group.this]
}

# Rule source - sg / egress
resource "aws_security_group_rule" "security_group_id_egress" {
    for_each          = { for i in local.sg_egress_rules : i.name => i}
    
    security_group_id = aws_security_group.this[each.value.sg_name].id
    type              = each.value.type
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    protocol          = each.value.protocol
    source_security_group_id = each.value.source_security_group_id
    prefix_list_ids   = each.value.prefix_list_ids
    description       = each.value.description

    depends_on = [aws_security_group.this]   
}