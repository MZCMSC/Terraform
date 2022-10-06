resource "aws_subnet" "this" {
  vpc_id = aws_vpc.this.id

  for_each = { for i in local.all_subnets : i.cidr => i }

  cidr_block        = each.key
  availability_zone = var.azs[index(var.subnets[each.value.name].cidr, each.key)]

  tags = merge(var.tags,
    tomap({
      Name = format(
        "%s-%s-%s-%s-%s-subnet",
        var.prefix,
        var.vpc_name,
        var.azs[index(var.subnets[each.value.name].cidr, each.key)],
        var.subnets[each.value.name].type,
        each.value.name
      )
    }),
    var.subnets[each.value.name].type == "private" ? { "Tier" = "private" } : {},
    var.subnets[each.value.name].type == "public" ? { "Tier" = "public" } : {}
  )
}