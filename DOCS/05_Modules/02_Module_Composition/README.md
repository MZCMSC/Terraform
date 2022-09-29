### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [05.Modules](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md) / [02.Module Composition](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/02_Module_Composition/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Providers/README.md">Providers</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md">Provisioners</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md">Modules</a>
    │         ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/01_Module_Sources/README.md">Module_Sources</a>
    │         └── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/02_Module_Composition/README.md">Module_Composition</a></b></i>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md">Functions</a>

</pre>

### Module Composition

> 루트 모듈이 하나만있는 간단한 Terraform 구성에서는 간단한 리소스 집합을 만들고 Terraform의 식 구문을 사용하여 이러한 리소스 간의 관계를 설명합니다.

```hcl
resource "aws_vpc" "example" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "example" {
  vpc_id = aws_vpc.example.id

  availability_zone = "ap-northeast-1b"
  cidr_block        = cidrsubnet(aws_vpc.example.cidr_block, 4, 1)
}
```

> 모듈 블록을 도입하면 구성이 단순하지 않고 계층 적이됩니다. 각 모듈에는 고유 한 리소스 세트와 자체 하위 모듈이 포함되어있어 심도 있고 복잡한 리소스 구성 트리를 만들 수 있습니다.

```hcl
module "network" {
  source = "./modules/aws-network"

  base_cidr_block = "10.0.0.0/8"
}

module "consul_cluster" {
  source = "./modules/aws-consul-cluster"

  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.subnet_ids
}
```

---

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/01_Module_Sources/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
