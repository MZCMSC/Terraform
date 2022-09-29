resource "aws_default_security_group" "this" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  tags   = merge(var.tags, tomap({ Name = format("%s-tf-msc-default-sg", var.prefix) }))
}

resource "aws_security_group" "this" {
    for_each = { for i in local.all_sg : i.name => i  }

    name = format("%s-tf-msc-%s-security-groups", var.prefix, each.value.name)
    
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

    tags = merge(var.tags, tomap({ Name = format("%s-tf-msc-%s-security-group", var.prefix, each.value.name)}))
}

// for_each 문을 사용하여 생성한 값
/* 
    aws_security_group.this[bastion].id
    aws_security_group.this[web].id
    aws_security_group.this[was].id
    aws_security_group.this[rds].id
    aws_security_group.this[front].id
    aws_security_group.this[backend].id
 */