# S3

1. **생성된 리소스 결과값**

> `$ tf state list`

```
aws_dynamodb_table.terraform_state_locks
aws_s3_bucket.terraform_state_backend
aws_s3_bucket_acl.this
aws_s3_bucket_server_side_encryption_configuration.this
aws_s3_bucket_versioning.this
```

2. **생성된 아웃풋 결과값**

> `$ tf output`

```
dynamodb_table_name = "test-terraform-state-locks"
region = "ap-northeast-2"
s3_bucket_acl = "private"
s3_bucket_name = "test-terraform-state-backend-msc"
s3_server_side_encryption_configuration = toset([
  {
    "apply_server_side_encryption_by_default" = tolist([
      {
        "kms_master_key_id" = ""
        "sse_algorithm" = "AES256"
      },
    ])
    "bucket_key_enabled" = tobool(null)
  },
])
s3_versioning = tolist([
  {
    "mfa_delete" = ""
    "status" = "Enabled"
  },
])
```

# VPC

1. **생성된 리소스 결과값**

> `$ tf state list`

```
aws_default_security_group.this
aws_eip.this[0]
aws_eip.this[1]
aws_internet_gateway.this
aws_internet_gateway_attachment.this
aws_nat_gateway.this["10.50.10.0/24"]
aws_nat_gateway.this["10.50.20.0/24"]
aws_route_table.private["10.50.110.0/24"]
aws_route_table.private["10.50.120.0/24"]
aws_route_table.private["10.50.210.0/24"]
aws_route_table.private["10.50.220.0/24"]
aws_route_table.private_with_natgw["10.50.130.0/24"]
aws_route_table.private_with_natgw["10.50.140.0/24"]
aws_route_table.public["10.50.10.0/24"]
aws_route_table.public["10.50.20.0/24"]
aws_route_table_association.private["10.50.110.0/24"]
aws_route_table_association.private["10.50.120.0/24"]
aws_route_table_association.private["10.50.210.0/24"]
aws_route_table_association.private["10.50.220.0/24"]
aws_route_table_association.private_with_natgw["10.50.130.0/24"]
aws_route_table_association.private_with_natgw["10.50.140.0/24"]
aws_route_table_association.public["10.50.10.0/24"]
aws_route_table_association.public["10.50.20.0/24"]
aws_subnet.this["10.50.10.0/24"]
aws_subnet.this["10.50.110.0/24"]
aws_subnet.this["10.50.120.0/24"]
aws_subnet.this["10.50.130.0/24"]
aws_subnet.this["10.50.140.0/24"]
aws_subnet.this["10.50.20.0/24"]
aws_subnet.this["10.50.210.0/24"]
aws_subnet.this["10.50.220.0/24"]
aws_vpc.this
```

2. **생성된 아웃풋 결과값**

> `$ tf output`

```
subnet_ids = {
  "10.50.10.0/24" = "subnet-06e1731a5812f62fd"
  "10.50.110.0/24" = "subnet-02c4e9df503563583"
  "10.50.120.0/24" = "subnet-009d1d53fcda49ea2"
  "10.50.130.0/24" = "subnet-072ba16cd51fbc4ad"
  "10.50.140.0/24" = "subnet-066eb7b714f79182c"
  "10.50.20.0/24" = "subnet-02f472a125383a1b2"
  "10.50.210.0/24" = "subnet-0f544b359505d09ae"
  "10.50.220.0/24" = "subnet-00cbc5b299fc6333f"
}
subnets = {
  "10.50.10.0/24" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:subnet/subnet-06e1731a5812f62fd"
    "assign_ipv6_address_on_creation" = false
    "availability_zone" = "ap-northeast-2a"
    "availability_zone_id" = "apne2-az1"
    "cidr_block" = "10.50.10.0/24"
    "customer_owned_ipv4_pool" = ""
    "enable_dns64" = false
    "enable_resource_name_dns_a_record_on_launch" = false
    "enable_resource_name_dns_aaaa_record_on_launch" = false
    "id" = "subnet-06e1731a5812f62fd"
    "ipv6_cidr_block" = ""
    "ipv6_cidr_block_association_id" = ""
    "ipv6_native" = false
    "map_customer_owned_ip_on_launch" = false
    "map_public_ip_on_launch" = false
    "outpost_arn" = ""
    "owner_id" = "123123123123"
    "private_dns_hostname_type_on_launch" = "ip-name"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2a-public-main-subnet"
      "Tier" = "public"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2a-public-main-subnet"
      "Tier" = "public"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "10.50.110.0/24" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:subnet/subnet-02c4e9df503563583"
    "assign_ipv6_address_on_creation" = false
    "availability_zone" = "ap-northeast-2a"
    "availability_zone_id" = "apne2-az1"
    "cidr_block" = "10.50.110.0/24"
    "customer_owned_ipv4_pool" = ""
    "enable_dns64" = false
    "enable_resource_name_dns_a_record_on_launch" = false
    "enable_resource_name_dns_aaaa_record_on_launch" = false
    "id" = "subnet-02c4e9df503563583"
    "ipv6_cidr_block" = ""
    "ipv6_cidr_block_association_id" = ""
    "ipv6_native" = false
    "map_customer_owned_ip_on_launch" = false
    "map_public_ip_on_launch" = false
    "outpost_arn" = ""
    "owner_id" = "123123123123"
    "private_dns_hostname_type_on_launch" = "ip-name"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2a-private-web-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2a-private-web-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "10.50.120.0/24" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:subnet/subnet-009d1d53fcda49ea2"
    "assign_ipv6_address_on_creation" = false
    "availability_zone" = "ap-northeast-2c"
    "availability_zone_id" = "apne2-az3"
    "cidr_block" = "10.50.120.0/24"
    "customer_owned_ipv4_pool" = ""
    "enable_dns64" = false
    "enable_resource_name_dns_a_record_on_launch" = false
    "enable_resource_name_dns_aaaa_record_on_launch" = false
    "id" = "subnet-009d1d53fcda49ea2"
    "ipv6_cidr_block" = ""
    "ipv6_cidr_block_association_id" = ""
    "ipv6_native" = false
    "map_customer_owned_ip_on_launch" = false
    "map_public_ip_on_launch" = false
    "outpost_arn" = ""
    "owner_id" = "123123123123"
    "private_dns_hostname_type_on_launch" = "ip-name"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2c-private-web-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2c-private-web-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "10.50.130.0/24" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:subnet/subnet-072ba16cd51fbc4ad"
    "assign_ipv6_address_on_creation" = false
    "availability_zone" = "ap-northeast-2a"
    "availability_zone_id" = "apne2-az1"
    "cidr_block" = "10.50.130.0/24"
    "customer_owned_ipv4_pool" = ""
    "enable_dns64" = false
    "enable_resource_name_dns_a_record_on_launch" = false
    "enable_resource_name_dns_aaaa_record_on_launch" = false
    "id" = "subnet-072ba16cd51fbc4ad"
    "ipv6_cidr_block" = ""
    "ipv6_cidr_block_association_id" = ""
    "ipv6_native" = false
    "map_customer_owned_ip_on_launch" = false
    "map_public_ip_on_launch" = false
    "outpost_arn" = ""
    "owner_id" = "123123123123"
    "private_dns_hostname_type_on_launch" = "ip-name"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2a-private-was-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2a-private-was-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "10.50.140.0/24" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:subnet/subnet-066eb7b714f79182c"
    "assign_ipv6_address_on_creation" = false
    "availability_zone" = "ap-northeast-2c"
    "availability_zone_id" = "apne2-az3"
    "cidr_block" = "10.50.140.0/24"
    "customer_owned_ipv4_pool" = ""
    "enable_dns64" = false
    "enable_resource_name_dns_a_record_on_launch" = false
    "enable_resource_name_dns_aaaa_record_on_launch" = false
    "id" = "subnet-066eb7b714f79182c"
    "ipv6_cidr_block" = ""
    "ipv6_cidr_block_association_id" = ""
    "ipv6_native" = false
    "map_customer_owned_ip_on_launch" = false
    "map_public_ip_on_launch" = false
    "outpost_arn" = ""
    "owner_id" = "123123123123"
    "private_dns_hostname_type_on_launch" = "ip-name"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2c-private-was-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2c-private-was-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "10.50.20.0/24" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:subnet/subnet-02f472a125383a1b2"
    "assign_ipv6_address_on_creation" = false
    "availability_zone" = "ap-northeast-2c"
    "availability_zone_id" = "apne2-az3"
    "cidr_block" = "10.50.20.0/24"
    "customer_owned_ipv4_pool" = ""
    "enable_dns64" = false
    "enable_resource_name_dns_a_record_on_launch" = false
    "enable_resource_name_dns_aaaa_record_on_launch" = false
    "id" = "subnet-02f472a125383a1b2"
    "ipv6_cidr_block" = ""
    "ipv6_cidr_block_association_id" = ""
    "ipv6_native" = false
    "map_customer_owned_ip_on_launch" = false
    "map_public_ip_on_launch" = false
    "outpost_arn" = ""
    "owner_id" = "123123123123"
    "private_dns_hostname_type_on_launch" = "ip-name"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2c-public-main-subnet"
      "Tier" = "public"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2c-public-main-subnet"
      "Tier" = "public"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "10.50.210.0/24" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:subnet/subnet-0f544b359505d09ae"
    "assign_ipv6_address_on_creation" = false
    "availability_zone" = "ap-northeast-2a"
    "availability_zone_id" = "apne2-az1"
    "cidr_block" = "10.50.210.0/24"
    "customer_owned_ipv4_pool" = ""
    "enable_dns64" = false
    "enable_resource_name_dns_a_record_on_launch" = false
    "enable_resource_name_dns_aaaa_record_on_launch" = false
    "id" = "subnet-0f544b359505d09ae"
    "ipv6_cidr_block" = ""
    "ipv6_cidr_block_association_id" = ""
    "ipv6_native" = false
    "map_customer_owned_ip_on_launch" = false
    "map_public_ip_on_launch" = false
    "outpost_arn" = ""
    "owner_id" = "123123123123"
    "private_dns_hostname_type_on_launch" = "ip-name"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2a-private-rds-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2a-private-rds-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "10.50.220.0/24" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:subnet/subnet-00cbc5b299fc6333f"
    "assign_ipv6_address_on_creation" = false
    "availability_zone" = "ap-northeast-2c"
    "availability_zone_id" = "apne2-az3"
    "cidr_block" = "10.50.220.0/24"
    "customer_owned_ipv4_pool" = ""
    "enable_dns64" = false
    "enable_resource_name_dns_a_record_on_launch" = false
    "enable_resource_name_dns_aaaa_record_on_launch" = false
    "id" = "subnet-00cbc5b299fc6333f"
    "ipv6_cidr_block" = ""
    "ipv6_cidr_block_association_id" = ""
    "ipv6_native" = false
    "map_customer_owned_ip_on_launch" = false
    "map_public_ip_on_launch" = false
    "outpost_arn" = ""
    "owner_id" = "123123123123"
    "private_dns_hostname_type_on_launch" = "ip-name"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2c-private-rds-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-vpc-ap-northeast-2c-private-rds-subnet"
      "Tier" = "private"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "VPC"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
}
vpc_id = "vpc-0251742e8eb1bd34c"
```

# SG

1. **생성된 리소스 결과값**

> `$ tf state list`

```
data.terraform_remote_state.vpc
aws_default_security_group.this
aws_security_group.this["backend"]
aws_security_group.this["bastion"]
aws_security_group.this["front"]
aws_security_group.this["rds"]
aws_security_group.this["was"]
aws_security_group.this["web"]
aws_security_group_rule.cidr_egress["backend_out_all"]
aws_security_group_rule.cidr_egress["bastion_out_all"]
aws_security_group_rule.cidr_egress["front_out_all"]
aws_security_group_rule.cidr_egress["rds_out_all"]
aws_security_group_rule.cidr_egress["was_out_all"]
aws_security_group_rule.cidr_egress["web_out_all"]
aws_security_group_rule.cidr_ingress["backend_in_8080"]
aws_security_group_rule.cidr_ingress["bastion_in_22"]
aws_security_group_rule.cidr_ingress["bastion_in_80"]
aws_security_group_rule.cidr_ingress["front_in_80"]
aws_security_group_rule.cidr_ingress["rds_in_3306"]
aws_security_group_rule.cidr_ingress["was_in_22"]
aws_security_group_rule.cidr_ingress["was_in_8080"]
aws_security_group_rule.cidr_ingress["web_in_22"]
aws_security_group_rule.cidr_ingress["web_in_80"]
```

2. **생성된 아웃풋 결과값**

> `$ tf output`

```
security_group_ids = {
  "backend" = "sg-0491a9ad052a4e7f6"
  "bastion" = "sg-00befa1c5be61d1c6"
  "front" = "sg-00c48fdc852703eeb"
  "rds" = "sg-0fb0f907e9efdf8d5"
  "was" = "sg-0729ccc3c5b27b8d6"
  "web" = "sg-02399b788fe26d4fe"
}
security_groups = {
  "backend" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:security-group/sg-0491a9ad052a4e7f6"
    "description" = "Managed by Terraform"
    "egress" = toset([])
    "id" = "sg-0491a9ad052a4e7f6"
    "ingress" = toset([])
    "name" = "test-tf-msc-backend-security-groups"
    "name_prefix" = ""
    "owner_id" = "123123123123"
    "revoke_rules_on_delete" = false
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-backend-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-backend-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "bastion" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:security-group/sg-00befa1c5be61d1c6"
    "description" = "Managed by Terraform"
    "egress" = toset([])
    "id" = "sg-00befa1c5be61d1c6"
    "ingress" = toset([])
    "name" = "test-tf-msc-bastion-security-groups"
    "name_prefix" = ""
    "owner_id" = "123123123123"
    "revoke_rules_on_delete" = false
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-bastion-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-bastion-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "front" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:security-group/sg-00c48fdc852703eeb"
    "description" = "Managed by Terraform"
    "egress" = toset([])
    "id" = "sg-00c48fdc852703eeb"
    "ingress" = toset([])
    "name" = "test-tf-msc-front-security-groups"
    "name_prefix" = ""
    "owner_id" = "123123123123"
    "revoke_rules_on_delete" = false
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-front-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-front-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "rds" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:security-group/sg-0fb0f907e9efdf8d5"
    "description" = "Managed by Terraform"
    "egress" = toset([])
    "id" = "sg-0fb0f907e9efdf8d5"
    "ingress" = toset([])
    "name" = "test-tf-msc-rds-security-groups"
    "name_prefix" = ""
    "owner_id" = "123123123123"
    "revoke_rules_on_delete" = false
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-rds-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-rds-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "was" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:security-group/sg-0729ccc3c5b27b8d6"
    "description" = "Managed by Terraform"
    "egress" = toset([])
    "id" = "sg-0729ccc3c5b27b8d6"
    "ingress" = toset([])
    "name" = "test-tf-msc-was-security-groups"
    "name_prefix" = ""
    "owner_id" = "123123123123"
    "revoke_rules_on_delete" = false
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-was-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-was-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
  "web" = {
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:security-group/sg-02399b788fe26d4fe"
    "description" = "Managed by Terraform"
    "egress" = toset([])
    "id" = "sg-02399b788fe26d4fe"
    "ingress" = toset([])
    "name" = "test-tf-msc-web-security-groups"
    "name_prefix" = ""
    "owner_id" = "123123123123"
    "revoke_rules_on_delete" = false
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-web-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-msc-web-security-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "SG"
    })
    "timeouts" = null /* object */
    "vpc_id" = "vpc-0251742e8eb1bd34c"
  }
}
```

# EC2

1. **생성된 리소스 결과값**

> `$ tf state list`

```
data.aws_ami.amazon-linux-2
data.terraform_remote_state.sg
data.terraform_remote_state.vpc
aws_eip.this["bastion"]
aws_instance.this["bastion"]
aws_instance.this["was_a"]
aws_instance.this["was_c"]
aws_instance.this["web_a"]
aws_instance.this["web_c"]
```

2. **생성된 아웃풋 결과값**

> `$ tf output`

```
ec2_instance_id = {
  "bastion" = "i-05a034e0b17d3405a"
  "was_a" = "i-074f32f978578c422"
  "was_c" = "i-09995e8a0affe7c53"
  "web_a" = "i-0459dbb8f5278e5e4"
  "web_c" = "i-0026cdc220464aaa3"
}
ec2_instances = {
  "bastion" = {
    "ami" = "ami-0c76973fbe0ee100c"
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:instance/i-05a034e0b17d3405a"
    "associate_public_ip_address" = false
    "availability_zone" = "ap-northeast-2a"
    "capacity_reservation_specification" = tolist([
      {
        "capacity_reservation_preference" = "open"
        "capacity_reservation_target" = tolist([])
      },
    ])
    "cpu_core_count" = 1
    "cpu_threads_per_core" = 1
    "credit_specification" = tolist([
      {
        "cpu_credits" = "standard"
      },
    ])
    "disable_api_stop" = false
    "disable_api_termination" = false
    "ebs_block_device" = toset([])
    "ebs_optimized" = false
    "enclave_options" = tolist([
      {
        "enabled" = false
      },
    ])
    "ephemeral_block_device" = toset([])
    "get_password_data" = false
    "hibernation" = false
    "host_id" = tostring(null)
    "iam_instance_profile" = ""
    "id" = "i-05a034e0b17d3405a"
    "instance_initiated_shutdown_behavior" = "stop"
    "instance_state" = "running"
    "instance_type" = "t2.micro"
    "ipv6_address_count" = 0
    "ipv6_addresses" = tolist([])
    "key_name" = "tf_test_key"
    "launch_template" = tolist([])
    "maintenance_options" = tolist([
      {
        "auto_recovery" = "default"
      },
    ])
    "metadata_options" = tolist([
      {
        "http_endpoint" = "enabled"
        "http_put_response_hop_limit" = 1
        "http_tokens" = "optional"
        "instance_metadata_tags" = "disabled"
      },
    ])
    "monitoring" = false
    "network_interface" = toset([])
    "outpost_arn" = ""
    "password_data" = ""
    "placement_group" = ""
    "placement_partition_number" = tonumber(null)
    "primary_network_interface_id" = "eni-0a3ece2d2dff0b92f"
    "private_dns" = "ip-10-50-10-55.ap-northeast-2.compute.internal"
    "private_dns_name_options" = tolist([
      {
        "enable_resource_name_dns_a_record" = false
        "enable_resource_name_dns_aaaa_record" = false
        "hostname_type" = "ip-name"
      },
    ])
    "private_ip" = "10.50.10.55"
    "public_dns" = ""
    "public_ip" = ""
    "root_block_device" = tolist([
      {
        "delete_on_termination" = true
        "device_name" = "/dev/xvda"
        "encrypted" = false
        "iops" = 100
        "kms_key_id" = ""
        "tags" = tomap({
          "CreatedByTerraform" = "True"
          "Name" = "test-tf-ap-northeast-2a-bastion-ebs"
          "owner" = "MSC"
          "purpose" = "Terraform_Test"
          "resource" = "EC2"
        })
        "throughput" = 0
        "volume_id" = "vol-0838683baadea961a"
        "volume_size" = 8
        "volume_type" = "gp2"
      },
    ])
    "secondary_private_ips" = toset([])
    "security_groups" = toset([
      "sg-00befa1c5be61d1c6",
    ])
    "source_dest_check" = true
    "subnet_id" = "subnet-06e1731a5812f62fd"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2a-bastion"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2a-bastion"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tenancy" = "default"
    "timeouts" = null /* object */
    "user_data" = tostring(null)
    "user_data_base64" = tostring(null)
    "user_data_replace_on_change" = false
    "volume_tags" = tomap(null) /* of string */
    "vpc_security_group_ids" = toset([
      "sg-00befa1c5be61d1c6",
    ])
  }
  "was_a" = {
    "ami" = "ami-0c76973fbe0ee100c"
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:instance/i-074f32f978578c422"
    "associate_public_ip_address" = false
    "availability_zone" = "ap-northeast-2a"
    "capacity_reservation_specification" = tolist([
      {
        "capacity_reservation_preference" = "open"
        "capacity_reservation_target" = tolist([])
      },
    ])
    "cpu_core_count" = 1
    "cpu_threads_per_core" = 1
    "credit_specification" = tolist([
      {
        "cpu_credits" = "standard"
      },
    ])
    "disable_api_stop" = false
    "disable_api_termination" = false
    "ebs_block_device" = toset([])
    "ebs_optimized" = false
    "enclave_options" = tolist([
      {
        "enabled" = false
      },
    ])
    "ephemeral_block_device" = toset([])
    "get_password_data" = false
    "hibernation" = false
    "host_id" = tostring(null)
    "iam_instance_profile" = ""
    "id" = "i-074f32f978578c422"
    "instance_initiated_shutdown_behavior" = "stop"
    "instance_state" = "running"
    "instance_type" = "t2.micro"
    "ipv6_address_count" = 0
    "ipv6_addresses" = tolist([])
    "key_name" = "tf_test_key"
    "launch_template" = tolist([])
    "maintenance_options" = tolist([
      {
        "auto_recovery" = "default"
      },
    ])
    "metadata_options" = tolist([
      {
        "http_endpoint" = "enabled"
        "http_put_response_hop_limit" = 1
        "http_tokens" = "optional"
        "instance_metadata_tags" = "disabled"
      },
    ])
    "monitoring" = false
    "network_interface" = toset([])
    "outpost_arn" = ""
    "password_data" = ""
    "placement_group" = ""
    "placement_partition_number" = tonumber(null)
    "primary_network_interface_id" = "eni-0683f6ad23c61317e"
    "private_dns" = "ip-10-50-130-177.ap-northeast-2.compute.internal"
    "private_dns_name_options" = tolist([
      {
        "enable_resource_name_dns_a_record" = false
        "enable_resource_name_dns_aaaa_record" = false
        "hostname_type" = "ip-name"
      },
    ])
    "private_ip" = "10.50.130.177"
    "public_dns" = ""
    "public_ip" = ""
    "root_block_device" = tolist([
      {
        "delete_on_termination" = true
        "device_name" = "/dev/xvda"
        "encrypted" = false
        "iops" = 100
        "kms_key_id" = ""
        "tags" = tomap({
          "CreatedByTerraform" = "True"
          "Name" = "test-tf-ap-northeast-2a-was-ebs"
          "owner" = "MSC"
          "purpose" = "Terraform_Test"
          "resource" = "EC2"
        })
        "throughput" = 0
        "volume_id" = "vol-08cc93849e3cf64b6"
        "volume_size" = 8
        "volume_type" = "gp2"
      },
    ])
    "secondary_private_ips" = toset([])
    "security_groups" = toset([
      "sg-0729ccc3c5b27b8d6",
    ])
    "source_dest_check" = true
    "subnet_id" = "subnet-072ba16cd51fbc4ad"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2a-was"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2a-was"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tenancy" = "default"
    "timeouts" = null /* object */
    "user_data" = tostring(null)
    "user_data_base64" = tostring(null)
    "user_data_replace_on_change" = false
    "volume_tags" = tomap(null) /* of string */
    "vpc_security_group_ids" = toset([
      "sg-0729ccc3c5b27b8d6",
    ])
  }
  "was_c" = {
    "ami" = "ami-0c76973fbe0ee100c"
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:instance/i-09995e8a0affe7c53"
    "associate_public_ip_address" = false
    "availability_zone" = "ap-northeast-2c"
    "capacity_reservation_specification" = tolist([
      {
        "capacity_reservation_preference" = "open"
        "capacity_reservation_target" = tolist([])
      },
    ])
    "cpu_core_count" = 1
    "cpu_threads_per_core" = 1
    "credit_specification" = tolist([
      {
        "cpu_credits" = "standard"
      },
    ])
    "disable_api_stop" = false
    "disable_api_termination" = false
    "ebs_block_device" = toset([])
    "ebs_optimized" = false
    "enclave_options" = tolist([
      {
        "enabled" = false
      },
    ])
    "ephemeral_block_device" = toset([])
    "get_password_data" = false
    "hibernation" = false
    "host_id" = tostring(null)
    "iam_instance_profile" = ""
    "id" = "i-09995e8a0affe7c53"
    "instance_initiated_shutdown_behavior" = "stop"
    "instance_state" = "running"
    "instance_type" = "t2.micro"
    "ipv6_address_count" = 0
    "ipv6_addresses" = tolist([])
    "key_name" = "tf_test_key"
    "launch_template" = tolist([])
    "maintenance_options" = tolist([
      {
        "auto_recovery" = "default"
      },
    ])
    "metadata_options" = tolist([
      {
        "http_endpoint" = "enabled"
        "http_put_response_hop_limit" = 1
        "http_tokens" = "optional"
        "instance_metadata_tags" = "disabled"
      },
    ])
    "monitoring" = false
    "network_interface" = toset([])
    "outpost_arn" = ""
    "password_data" = ""
    "placement_group" = ""
    "placement_partition_number" = tonumber(null)
    "primary_network_interface_id" = "eni-0b35f1de97683a3c1"
    "private_dns" = "ip-10-50-140-187.ap-northeast-2.compute.internal"
    "private_dns_name_options" = tolist([
      {
        "enable_resource_name_dns_a_record" = false
        "enable_resource_name_dns_aaaa_record" = false
        "hostname_type" = "ip-name"
      },
    ])
    "private_ip" = "10.50.140.187"
    "public_dns" = ""
    "public_ip" = ""
    "root_block_device" = tolist([
      {
        "delete_on_termination" = true
        "device_name" = "/dev/xvda"
        "encrypted" = false
        "iops" = 100
        "kms_key_id" = ""
        "tags" = tomap({
          "CreatedByTerraform" = "True"
          "Name" = "test-tf-ap-northeast-2c-was-ebs"
          "owner" = "MSC"
          "purpose" = "Terraform_Test"
          "resource" = "EC2"
        })
        "throughput" = 0
        "volume_id" = "vol-0d064807e4d970add"
        "volume_size" = 8
        "volume_type" = "gp2"
      },
    ])
    "secondary_private_ips" = toset([])
    "security_groups" = toset([
      "sg-0729ccc3c5b27b8d6",
    ])
    "source_dest_check" = true
    "subnet_id" = "subnet-066eb7b714f79182c"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2c-was"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2c-was"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tenancy" = "default"
    "timeouts" = null /* object */
    "user_data" = tostring(null)
    "user_data_base64" = tostring(null)
    "user_data_replace_on_change" = false
    "volume_tags" = tomap(null) /* of string */
    "vpc_security_group_ids" = toset([
      "sg-0729ccc3c5b27b8d6",
    ])
  }
  "web_a" = {
    "ami" = "ami-0c76973fbe0ee100c"
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:instance/i-0459dbb8f5278e5e4"
    "associate_public_ip_address" = false
    "availability_zone" = "ap-northeast-2a"
    "capacity_reservation_specification" = tolist([
      {
        "capacity_reservation_preference" = "open"
        "capacity_reservation_target" = tolist([])
      },
    ])
    "cpu_core_count" = 1
    "cpu_threads_per_core" = 1
    "credit_specification" = tolist([
      {
        "cpu_credits" = "standard"
      },
    ])
    "disable_api_stop" = false
    "disable_api_termination" = false
    "ebs_block_device" = toset([])
    "ebs_optimized" = false
    "enclave_options" = tolist([
      {
        "enabled" = false
      },
    ])
    "ephemeral_block_device" = toset([])
    "get_password_data" = false
    "hibernation" = false
    "host_id" = tostring(null)
    "iam_instance_profile" = ""
    "id" = "i-0459dbb8f5278e5e4"
    "instance_initiated_shutdown_behavior" = "stop"
    "instance_state" = "running"
    "instance_type" = "t2.micro"
    "ipv6_address_count" = 0
    "ipv6_addresses" = tolist([])
    "key_name" = "tf_test_key"
    "launch_template" = tolist([])
    "maintenance_options" = tolist([
      {
        "auto_recovery" = "default"
      },
    ])
    "metadata_options" = tolist([
      {
        "http_endpoint" = "enabled"
        "http_put_response_hop_limit" = 1
        "http_tokens" = "optional"
        "instance_metadata_tags" = "disabled"
      },
    ])
    "monitoring" = false
    "network_interface" = toset([])
    "outpost_arn" = ""
    "password_data" = ""
    "placement_group" = ""
    "placement_partition_number" = tonumber(null)
    "primary_network_interface_id" = "eni-019b9016a8387fe79"
    "private_dns" = "ip-10-50-110-41.ap-northeast-2.compute.internal"
    "private_dns_name_options" = tolist([
      {
        "enable_resource_name_dns_a_record" = false
        "enable_resource_name_dns_aaaa_record" = false
        "hostname_type" = "ip-name"
      },
    ])
    "private_ip" = "10.50.110.41"
    "public_dns" = ""
    "public_ip" = ""
    "root_block_device" = tolist([
      {
        "delete_on_termination" = true
        "device_name" = "/dev/xvda"
        "encrypted" = false
        "iops" = 100
        "kms_key_id" = ""
        "tags" = tomap({
          "CreatedByTerraform" = "True"
          "Name" = "test-tf-ap-northeast-2a-web-ebs"
          "owner" = "MSC"
          "purpose" = "Terraform_Test"
          "resource" = "EC2"
        })
        "throughput" = 0
        "volume_id" = "vol-0d237c0dcd4a68916"
        "volume_size" = 8
        "volume_type" = "gp2"
      },
    ])
    "secondary_private_ips" = toset([])
    "security_groups" = toset([
      "sg-02399b788fe26d4fe",
    ])
    "source_dest_check" = true
    "subnet_id" = "subnet-02c4e9df503563583"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2a-web"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2a-web"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tenancy" = "default"
    "timeouts" = null /* object */
    "user_data" = tostring(null)
    "user_data_base64" = tostring(null)
    "user_data_replace_on_change" = false
    "volume_tags" = tomap(null) /* of string */
    "vpc_security_group_ids" = toset([
      "sg-02399b788fe26d4fe",
    ])
  }
  "web_c" = {
    "ami" = "ami-0c76973fbe0ee100c"
    "arn" = "arn:aws:ec2:ap-northeast-2:123123123123:instance/i-0026cdc220464aaa3"
    "associate_public_ip_address" = false
    "availability_zone" = "ap-northeast-2c"
    "capacity_reservation_specification" = tolist([
      {
        "capacity_reservation_preference" = "open"
        "capacity_reservation_target" = tolist([])
      },
    ])
    "cpu_core_count" = 1
    "cpu_threads_per_core" = 1
    "credit_specification" = tolist([
      {
        "cpu_credits" = "standard"
      },
    ])
    "disable_api_stop" = false
    "disable_api_termination" = false
    "ebs_block_device" = toset([])
    "ebs_optimized" = false
    "enclave_options" = tolist([
      {
        "enabled" = false
      },
    ])
    "ephemeral_block_device" = toset([])
    "get_password_data" = false
    "hibernation" = false
    "host_id" = tostring(null)
    "iam_instance_profile" = ""
    "id" = "i-0026cdc220464aaa3"
    "instance_initiated_shutdown_behavior" = "stop"
    "instance_state" = "running"
    "instance_type" = "t2.micro"
    "ipv6_address_count" = 0
    "ipv6_addresses" = tolist([])
    "key_name" = "tf_test_key"
    "launch_template" = tolist([])
    "maintenance_options" = tolist([
      {
        "auto_recovery" = "default"
      },
    ])
    "metadata_options" = tolist([
      {
        "http_endpoint" = "enabled"
        "http_put_response_hop_limit" = 1
        "http_tokens" = "optional"
        "instance_metadata_tags" = "disabled"
      },
    ])
    "monitoring" = false
    "network_interface" = toset([])
    "outpost_arn" = ""
    "password_data" = ""
    "placement_group" = ""
    "placement_partition_number" = tonumber(null)
    "primary_network_interface_id" = "eni-088fb3bdb9ecad92a"
    "private_dns" = "ip-10-50-120-224.ap-northeast-2.compute.internal"
    "private_dns_name_options" = tolist([
      {
        "enable_resource_name_dns_a_record" = false
        "enable_resource_name_dns_aaaa_record" = false
        "hostname_type" = "ip-name"
      },
    ])
    "private_ip" = "10.50.120.224"
    "public_dns" = ""
    "public_ip" = ""
    "root_block_device" = tolist([
      {
        "delete_on_termination" = true
        "device_name" = "/dev/xvda"
        "encrypted" = false
        "iops" = 100
        "kms_key_id" = ""
        "tags" = tomap({
          "CreatedByTerraform" = "True"
          "Name" = "test-tf-ap-northeast-2c-web-ebs"
          "owner" = "MSC"
          "purpose" = "Terraform_Test"
          "resource" = "EC2"
        })
        "throughput" = 0
        "volume_id" = "vol-02d75518789bf79d0"
        "volume_size" = 8
        "volume_type" = "gp2"
      },
    ])
    "secondary_private_ips" = toset([])
    "security_groups" = toset([
      "sg-02399b788fe26d4fe",
    ])
    "source_dest_check" = true
    "subnet_id" = "subnet-009d1d53fcda49ea2"
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2c-web"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-ap-northeast-2c-web"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "EC2"
    })
    "tenancy" = "default"
    "timeouts" = null /* object */
    "user_data" = tostring(null)
    "user_data_base64" = tostring(null)
    "user_data_replace_on_change" = false
    "volume_tags" = tomap(null) /* of string */
    "vpc_security_group_ids" = toset([
      "sg-02399b788fe26d4fe",
    ])
  }
}
```

# ALB

1. **생성된 리소스 결과값**

> `$ tf state list`

```
data.terraform_remote_state.ec2
data.terraform_remote_state.sg
data.terraform_remote_state.vpc
aws_lb.this["backend"]
aws_lb.this["front"]
aws_lb_listener.this["backend"]
aws_lb_listener.this["front"]
aws_lb_target_group.this["backend"]
aws_lb_target_group.this["front"]
aws_lb_target_group_attachment.this["was_a"]
aws_lb_target_group_attachment.this["was_c"]
aws_lb_target_group_attachment.this["web_a"]
aws_lb_target_group_attachment.this["web_c"]
```

2. **생성된 아웃풋 결과값**

> `$ tf output`

```
alb_ids = {
  "backend" = "arn:aws:elasticloadbalancing:ap-northeast-2:123123123123:loadbalancer/app/test-tf-backend-alb/11d29918e9452972"
  "front" = "arn:aws:elasticloadbalancing:ap-northeast-2:123123123123:loadbalancer/app/test-tf-front-alb/9e86a2db4d77fbcd"
}
alb_tg_attach_ids = {
  "was_a" = "arn:aws:elasticloadbalancing:ap-northeast-2:123123123123:targetgroup/test-tf-backend-alb-tg/ab462a24be340d4d-20220923095906453700000001"
  "was_c" = "arn:aws:elasticloadbalancing:ap-northeast-2:123123123123:targetgroup/test-tf-backend-alb-tg/ab462a24be340d4d-20220923095906537800000004"
  "web_a" = "arn:aws:elasticloadbalancing:ap-northeast-2:123123123123:targetgroup/test-tf-front-alb-tg/a9382c1a1b9e0079-20220923095906537700000003"
  "web_c" = "arn:aws:elasticloadbalancing:ap-northeast-2:123123123123:targetgroup/test-tf-front-alb-tg/a9382c1a1b9e0079-20220923095906484700000002"
}
alb_tg_ids = {
  "backend" = "arn:aws:elasticloadbalancing:ap-northeast-2:123123123123:targetgroup/test-tf-backend-alb-tg/ab462a24be340d4d"
  "front" = "arn:aws:elasticloadbalancing:ap-northeast-2:123123123123:targetgroup/test-tf-front-alb-tg/a9382c1a1b9e0079"
}
```

# RDS

1. **생성된 리소스 결과값**

> `$ tf state list`

```
data.terraform_remote_state.ec2
data.terraform_remote_state.sg
data.terraform_remote_state.vpc
aws_db_parameter_group.this["msc_rds_aurora"]
aws_db_subnet_group.this["msc_rds_aurora"]
aws_rds_cluster.this["msc_rds_aurora"]
aws_rds_cluster_instance.this["bule"]
aws_rds_cluster_instance.this["green"]
aws_rds_cluster_parameter_group.this["msc_rds_aurora"]
```

2. **생성된 아웃풋 결과값**

> `$ tf output`

```
cluster_parameter_group = {
  "msc_rds_aurora" = {
    "arn" = "arn:aws:rds:ap-northeast-2:123123123123:cluster-pg:test-tf-aurora-mysql8-0-parameter-group"
    "description" = "test-tf-aurora-mysql8-0-parameter-group"
    "family" = "aurora-mysql8.0"
    "id" = "test-tf-aurora-mysql8-0-parameter-group"
    "name" = "test-tf-aurora-mysql8-0-parameter-group"
    "name_prefix" = ""
    "parameter" = toset([
      {
        "apply_method" = "immediate"
        "name" = "character_set_client"
        "value" = "utf8"
      },
      {
        "apply_method" = "immediate"
        "name" = "character_set_server"
        "value" = "utf8"
      },
    ])
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-aurora-mysql8-0--parameter-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "ALB"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-aurora-mysql8-0--parameter-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "ALB"
    })
  }
}
cluster_parameter_group_id = {
  "msc_rds_aurora" = "test-tf-aurora-mysql8-0-parameter-group"
}
db_parameter_group = {
  "msc_rds_aurora" = {
    "arn" = "arn:aws:rds:ap-northeast-2:123123123123:pg:test-tf-aurora-mysql8-0-parameter-group"
    "description" = "test-tf-aurora-mysql8-0-parameter-group"
    "family" = "aurora-mysql8.0"
    "id" = "test-tf-aurora-mysql8-0-parameter-group"
    "name" = "test-tf-aurora-mysql8-0-parameter-group"
    "name_prefix" = tostring(null)
    "parameter" = toset([])
    "tags" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-aurora-mysql8-0--parameter-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "ALB"
    })
    "tags_all" = tomap({
      "CreatedByTerraform" = "True"
      "Name" = "test-tf-aurora-mysql8-0--parameter-group"
      "owner" = "MSC"
      "purpose" = "Terraform_Test"
      "resource" = "ALB"
    })
  }
}
db_parameter_group_id = {
  "msc_rds_aurora" = "test-tf-aurora-mysql8-0-parameter-group"
}
rds_cluster = <sensitive>
```
