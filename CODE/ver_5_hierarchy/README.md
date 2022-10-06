# Code guide

## AWS 서비스 단위 폴더 구성 및 변수에 \*.tfvars 파일 및 locals 블럭 사용

### 폴더 및 파일 구성

```
.
├── 00_S3
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── state-backend.tf
│   ├── terraform.tfvars
│   └── variables.tf
│
├── 01_VPC
│   ├── internat_gateway.tf
│   ├── local.tf
│   ├── main.tf
│   ├── nat_gateways.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── route_tables.tf
│   ├── security_group.tf
│   ├── subnets.tf
│   ├── terraform.tfvars
│   ├── variable.tf
│   └── vpc.tf
│
├── 02_SG
│   ├── data.tf
│   ├── local.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── security_group.tf
│   ├── security_group_rule.tf
│   ├── terraform.tfvars
│   └── variables.tf
│
├── 03_EC2
│   ├── data.tf
│   ├── ec2.tf
│   ├── local.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variable.tf
│
├── 05_ALB
│   ├── data.tf
│   ├── elb_alb.tf
│   ├── elb_alb_listener.tf
│   ├── elb_alb_tg.tf
│   ├── local.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variable.tf
│
└── 06_RDS
    ├── data.tf
    ├── local.tf
    ├── main.tf
    ├── output.tf
    ├── parameter_group.tf
    ├── provider.tf
    ├── rds_aurora.tf
    ├── subnet_group.tf
    ├── terraform.tfvars
    └── variable.tf
```

---

> **폴더에 추가 생성된 파일**
>
> ```
> .
> ├── local.tf
> └── terraform.tfvars
> ```

---

> **향후 생성 추가 되는 파일**
>
> - terraform init 명령어 적용시 생성 파일
>   - 각각 폴더별 Terraform 실행은 가능하나, 각 폴더당 .terraform 폴더가 생성되어 용량 증가
>
> ```
> .
> ├── .terraform
> │   └── providers
> │  
> └── .terraform.lock.hcl
> ```
>
> - terraform plan 명령어 적용시 생성 파일
>
> ```
> . 
> └── planfile
> ```
>
> - terraform apply 명령어 적용시
>   - S3 생성시 local에 생성
>   - S3 제외 다른 폴더에 있는 리소스는 원격에 생성 (AWS S3 bucket)
>
> ```
> .
> ├── terraform.tfstate
> └── terraform.tfstate.backup
>
> (apply 2회 적용시 생성)
> ```

---

### 참고 사항

```
S3 생성은 local backend
- terraform.tfstate (local에 생성)

VPC/EC2/SG/RDS는 remote backend
- terraform.tfstate (AWS S3에 생성)
```

---

### 테라폼 명령어

```
실행
$ terraform init

계획
$ terraform plan -refresh=false -out=planfile -var-file=terraform.tfvars

적용
$ terraform apply planfile
```

```
적용 완료시 설정값 확인 (*.tfstate 파일)
$ terraform refresh
$ terraform show
```

---

### 사용된 리소스 블럭

```
1. terraform    block
2. provider     block
3. resource     block
4. output       block
5. data         block
6. variable     block
7. function
8. locals       black
```

> 참고용 URL
>
> - https://www.terraform.io/intro
> - https://www.terraform.io/language
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs
> - https://www.terraform.io/language/values/locals
> -

---

# S3 Folder

> 폴더 항목
>
> ```
> 00_S3
> ├── main.tf
> ├── outputs.tf
> ├── provider.tf
> ├── state-backend.tf
> ├── terraform.tfvars
> └── variables.tf
> ```

---

> 명령어
>
> ```
> $ cd 00_S3
>
> $ terraform init
> $ terraform plan -refresh=false -out=planfile -var-file=terraform.tfvars
> $ terraform apply planfile
> ```

---

## 00_S3/terraform.tfvars

```hcl
region = "ap-northeast-2"

s3_bucket = "test-terraform-state-backend-msc"

s3_acl    = "private"

dynamodb_table = "test-terraform-state-locks"

tags = {
  "CreatedByTerraform" = "true"
  "purpose"            = "Terraform_Test"
  "owner"              = "MSC"
  "resource"           = "backend_S3"
}
```

## 00_S3/variable.tf

```hcl
variable "region" {
  type        = string
  default     = ""
}
variable "s3_bucket" {
  type        = string
  default     = ""
}
variable "s3_acl" {
  type        = string
  default     = ""
}
variable "dynamodb_table" {
  type        = string
  default     = ""
}
variable "tags" {
  type        = map(string)
}
```

- **variable 과 variable value을 분리해서 작성 진행**
  - **`terraform.tfvars`** 파일의 **`region`** 은 **`variable.tf`** 파일의 **`region`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`s3_bucket`** 은 **`variable.tf`** 파일의 **`s3_bucket`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`s3_acl`** 은 **`variable.tf`** 파일의 **`s3_acl`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`dynamodb_table`** 은 **`variable.tf`** 파일의 **`dynamodb_table`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`tags`** 은 **`variable.tf`** 파일의 **`tags`** 에 매칭 된다.

> 참고용 URL
>
> - https://www.terraform.io/language/values/variables

---

# VPC Folder

> 폴더 항목
>
> ```
> 01_VPC
> ├── internat_gateway.tf
> ├── local.tf
> ├── main.tf
> ├── nat_gateways.tf
> ├── output.tf
> ├── provider.tf
> ├── route_tables.tf
> ├── security_group.tf
> ├── subnets.tf
> ├── terraform.tfvars
> ├── variable.tf
> └── vpc.tf
> ```

---

> 명령어
>
> ```
> $ cd 00_S3
>
> $ terraform init
> $ terraform plan -refresh=false -out=planfile -var-file=terraform.tfvars
> $ terraform apply planfile
> ```

---

## 01_VPC/terraform.tfvars

```hcl
region = "ap-northeast-2"

prefix = "test"

azs = ["ap-northeast-2a", "ap-northeast-2c"]

vpc_name = "tf-vpc"
vpc_cidr = "10.50.0.0/16"

enable_dns_hostnames = "true"
enable_dns_support   = "true"

enable_internet_gateway = "true"
enable_nat_gateway      = "true"

subnets = {
  main = {
    "cidr"  = ["10.50.10.0/24", "10.50.20.0/24"]
    "type"  = "public"
    "natgw" = "no"
  },
  web = {
    "cidr"  = ["10.50.110.0/24", "10.50.120.0/24"]
    "type"  = "private"
    "natgw" = "no"
  },
  was = {
    "cidr"  = ["10.50.130.0/24", "10.50.140.0/24"]
    "type"  = "private"
    "natgw" = "yes"
  },
  rds = {
    "cidr"  = ["10.50.210.0/24", "10.50.220.0/24"]
    "type"  = "private"
    "natgw" = "no"
  }
}

tags = {
  "CreatedByTerraform" = "True"
  "purpose"            = "Terraform_Test"
  "owner"              = "MSC"
  "resource"           = "VPC"
}
```

## 01_VPC/variable.tf

```hcl
variable "region" {
  type        = string
  default     = ""
}
variable "prefix" {
  type        = string
  default     = ""
}
variable "azs" {
  type        = list(string)
  default     = []
}
variable "vpc_name" {
  type        = string
  default     = ""
}
variable "vpc_cidr" {
  type        = string
  default     = ""
}
variable "enable_dns_hostnames" {
  type    = string
  default = "true"
}
variable "enable_dns_support" {
  type    = string
  default = "true"
}
variable "enable_internet_gateway" {
  type        = string
  default     = "false"
}
variable "enable_nat_gateway" {
  type        = string
  default     = "false"
}
variable "subnets" {
  type        = map(any)
  default = { }
}
variable "tags" {
  type        = map(string)
  default = { }
}
```

- **variable 과 variable value을 분리해서 작성 진행**
  - **`terraform.tfvars`** 파일의 **`region`** 은 **`variable.tf`** 파일의 **`region`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`prefix`** 은 **`variable.tf`** 파일의 **`prefix`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`azs`** 은 **`variable.tf`** 파일의 **`azs`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`vpc_name`** 은 **`variable.tf`** 파일의 **`vpc_name`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`vpc_cidr`** 은 **`variable.tf`** 파일의 **`vpc_cidr`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`enable_dns_hostnames`** 은 **`variable.tf`** 파일의 **`enable_dns_hostnames`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`enable_dns_support`** 은 **`variable.tf`** 파일의 **`enable_dns_support`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`enable_internet_gateway`** 은 **`variable.tf`** 파일의 **`enable_internet_gateway`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`enable_nat_gateway`** 은 **`variable.tf`** 파일의 **`enable_nat_gateway`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`subnets`** 은 **`variable.tf`** 파일의 **`subnets`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`tags`** 은 **`variable.tf`** 파일의 **`tags`** 에 매칭 된다.

> 참고용 URL
>
> - https://www.terraform.io/language/values/variables

---

## 01_VPC/local.tf

```hcl
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
```

- **locals {...} 블럭 생성 진행**
  - `all_subnets`
  - `public_subnets`
  - `private_subnets`

> 참고용 URL
>
> - https://www.terraform.io/language/values/locals
> - https://www.terraform.io/language/expressions/for

---

## 01_VPC/output.tf

```hcl
output "vpc_id" {
  value = aws_vpc.this.id
}
output "subnets" {
    value = aws_subnet.this
}
output "subnet_ids" {
    value = {for key, value in aws_subnet.this : key => value.id}
}
```

- **output "vpc_id" {...} 블럭 생성 진행**
  - resource 블럭 aws_vpc.this 의 id 값
- **output "subnets" {...} 블럭 생성 진행**
  - resource 블럭 aws_subnet.this 의 전체 값
- **output "subnet_ids" {...} 블럭 생성 진행**
  - resource 블럭 aws_subnet.this 의 id 값

> 참고용 URL
>
> - https://www.terraform.io/language/values/outputs
> - https://www.terraform.io/language/expressions/for

---

# SG Folder

> 폴더 항목
>
> ```
> 02_SG
> ├── data.tf
> ├── local.tf
> ├── main.tf
> ├── output.tf
> ├── provider.tf
> ├── security_group.tf
> ├── security_group_rule.tf
> ├── terraform.tfvars
> └── variables.tf
> ```

---

> 명령어
>
> ```
> $ cd 00_S3
>
> $ terraform init
> $ terraform plan -refresh=false -out=planfile -var-file=terraform.tfvars
> $ terraform apply planfile
> ```

---

## 02_SG/terraform.tfvars

```hcl
region = "ap-northeast-2"

prefix = "test"

tags = {
  "CreatedByTerraform" = "True"
  "purpose"            = "Terraform_Test"
  "owner"              = "MSC"
  "resource"           = "SG"
}

sg_name = {
    bastion = "bastion"
    web =  "web"
    was =  "was"
    rds =  "rds"
    front = "front"
    backend = "backend"
}


rules = {
  bastion_in_22 = {
      sg_name                  = "bastion"
      security_group_id        = ""
      type                     = "ingress"
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      cidr_blocks              = ["0.0.0.0/0", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "SSH for Bastion server"
    },
    bastion_in_80 = {
      sg_name                  = "bastion"
      security_group_id        = ""
      type                     = "ingress"
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      cidr_blocks              = ["100.100.100.100/32", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Monitoring HTTP 80 port"
    },
    bastion_out_all = {
      sg_name                  = "bastion"
      security_group_id        = ""
      type                     = "egress"
      from_port                = 0
      to_port                  = 0
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Default SG outbound rule"
    },

    web_in_22 = {
      sg_name                  = "web"
      security_group_id        = ""
      type                     = "ingress"
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      cidr_blocks              = ["10.50.10.0/24", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Bastion to WEB"
    },
    web_in_80 = {
      sg_name                  = "web"
      security_group_id        = ""
      type                     = "ingress"
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      cidr_blocks              = ["10.50.10.0/24", "10.50.20.0/24", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "WEB HTTP 80 port"
    },
    web_out_all = {
      sg_name                  = "web"
      security_group_id        = ""
      type                     = "egress"
      from_port                = 0
      to_port                  = 0
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Default SG outbound rule"
    },
    was_in_22 = {
      sg_name                  = "was"
      security_group_id        = ""
      type                     = "ingress"
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      cidr_blocks              = ["10.50.10.0/24", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Bastion to WAS"
    },
    was_in_8080 = {
      sg_name                  = "was"
      security_group_id        = ""
      type                     = "ingress"
      from_port                = 8080
      to_port                  = 8080
      protocol                 = "tcp"
      cidr_blocks              = ["10.50.110.0/24", "10.50.120.0/24", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "WAS 8080 port"
    },
    was_out_all = {
      sg_name                  = "was"
      security_group_id        = ""
      type                     = "egress"
      from_port                = 0
      to_port                  = 0
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Default SG outbound rule"
    },
    rds_in_3306 = {
      sg_name                  = "rds"
      security_group_id        = ""
      type                     = "ingress"
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      cidr_blocks              = ["10.50.10.0/24", "10.50.130.0/24", "10.50.140.0/24" ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "AWS Aurora RDS 3306 port"
    },
    rds_out_all = {
      sg_name                  = "rds"
      security_group_id        = ""
      type                     = "egress"
      from_port                = 0
      to_port                  = 0
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Default SG outbound rule"
    },
    front_in_80 = {
      sg_name                  = "front"
      security_group_id        = ""
      type                     = "ingress"
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      cidr_blocks              = ["0.0.0.0/0" ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Front ALB SG - HTTP 80 port"
    },
    front_out_all = {
      sg_name                  = "front"
      security_group_id        = ""
      type                     = "egress"
      from_port                = 0
      to_port                  = 0
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Default SG outbound rule"
    },
    backend_in_8080 = {
      sg_name                  = "backend"
      security_group_id        = ""
      type                     = "ingress"
      from_port                = 8080
      to_port                  = 8080
      protocol                 = "tcp"
      cidr_blocks              = ["10.50.110.0/24", "10.50.120.0/24", "10.50.130.0/24", "10.50.140.0/24", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Backend ALB SG - 8080 port"
    },
    backend_out_all = {
      sg_name                  = "backend"
      security_group_id        = ""
      type                     = "egress"
      from_port                = 0
      to_port                  = 0
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0", ]
      source_security_group_id = ""
      ipv6_cidr_blocks         = []
      prefix_list_ids          = []
      self                     = false
      description              = "Default SG outbound rule"
    }
}
```

## 02_SG/variable.tf

```hcl
variable "region" {
  type        = string
  default     = ""
}
variable "prefix" {
  # prd,stg,dev,test
  description = "AWS Prefix"
  type        = string
  default     = ""
}
variable "tags" {
  type        = map(string)
  default = {}
}
variable "sg_name" {
  type = map(string)
  default = {}
}
variable "rules" {
  type        = map(any)
  default = {}
}
```

- **variable 과 variable value을 분리해서 작성 진행**
  - **`terraform.tfvars`** 파일의 **`region`** 은 **`variable.tf`** 파일의 **`region`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`prefix`** 은 **`variable.tf`** 파일의 **`prefix`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`tags`** 은 **`variable.tf`** 파일의 **`tags`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`sg_name`** 은 **`variable.tf`** 파일의 **`sg_name`** 에 매칭 된다.
  - **`terraform.tfvars`** 파일의 **`rules`** 은 **`variable.tf`** 파일의 **`rules`** 에 매칭 된다.

---

## 02_SG/local.tf

```hcl
locals {
  all_sg = flatten([
    for key in var.sg_name : {
      name = key
    }
  ])
}
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
```

- **locals {...} 블럭 생성 진행**
  - `all_sg`
  - `cidr_ingress_rules`
  - `cidr_egress_rules`
  - `self_ingress_rules`
  - `self_egress_rules`
  - `sg_ingress_rules`
  - `sg_egress_rules`

> 참고용 URL
>
> - https://www.terraform.io/language/values/locals
> - https://www.terraform.io/language/expressions/for

---

## 02_SG/security_group.tf

```hcl
resource "aws_security_group" "this" {
    for_each = { for i in local.all_sg : i.name => i  }

    name = format("%s-tf-msc-%s-security-groups", var.prefix, each.value.name)

    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

    tags = merge(var.tags, tomap({ Name = format("%s-tf-msc-%s-security-group", var.prefix, each.value.name)}))
}
```

- **resource "aws_security_group" "this" {...} 블럭 생성 진행**
  - `for_each` Meta-Argument 사용하여 해당 블럭 생성
    - `local.tf` 파일 `local.all_sg` name 값 만큼 생성
      - `local.all_sg` 값은 `variable.tf` 파일의 `sg_name` 값 참조

> 참고용 URL
>
> - https://www.terraform.io/language/meta-arguments/for_each
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule

---
