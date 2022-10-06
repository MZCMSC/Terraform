### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [07.Modules](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Modules/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Input_Variables/README.md">Input_Variables</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Providers/README.md">Providers</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Resources/README.md">Resources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Output_Values/README.md">Output_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/05_Local_Values/README.md">Local_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Data_Sources/README.md">Data_Sources</a>
    │                        ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Modules/README.md">Modules</a></b></i>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/08_Settings/README.md">Settings</a>
    │                        └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/09_Syntax/README.md">Syntax</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Providers/README.md">Providers</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md">Provisioners</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md">Modules</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md">Functions</a>
</pre>

---

### Moudles

> module은 함께 사용되는 여러 리소스의 컨테이너입니다.

> 모든 Terraform 구성에는 기본 작업 디렉토리의 .tf 파일에 정의 된 리소스로 구성된 루트 모듈이라고 하는 하나 이상의 모듈이 있습니다.  
> 모듈은 다른 모듈을 호출 할 수 있으며, 이른 통해 하위 모듈의 리소스를 간결하게 구성에 포함시킬 수 있습니다.  
> 동일한 구성 내에서 또는 별도의 구성으로 모듈을 여러 번 호출하여 리소스 구성을 패키지화 하고 재사용할 수 있습니다.

> terraform plan 또는 terraform apply 시 작업 디렉토리의 .tf 파일은 루트 모듈에서 함께 적용됩니다. 해당 모듈은 다른 모듈을 호출하고 하나의 출력 값을 다른 모듈의 입력 값으로 전달하여 서로 연결할 수 있습니다.

```
$ tree sample-module/
.
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── ...
├── examples/
│   ├── main.tf
│   ├── .../
```

#### Calling a Child Module

> Module 블록을 사용하여 설정합니다.

```hcl
module "servers" {
  source = "./sub_module"

  servers = 5
}
```

> module 키워드는 바로 뒤에 있는 레이블은 로컬 이름이며 호출 모듈은 이 모듈 인스턴스를 참조하는데 사용할 수 있습니다.  
> 모든 모듈에는 Terraform CLI에 의해 정의된 메타 인수인 source 인수가 필요합니다.  
>  그 값은 모듈 구성 파일의 로컬 디렉토리에 대한 경로이거나 Terraform이 다운로드하여 사용해야 하는 원격 모듈 소스입니다.

```hcl
module "vpc" {
  source = "github.com/nalbam/terraform-aws-vpc?ref=v0.12.22"

  region = var.region
  name   = var.name

  vpc_id   = var.vpc_id
  vpc_cidr = var.vpc_cidr
}
```

> 깃헙 주소 https://github.com/nalbam/terraform-aws-vpc 에서 v0.12.22 Tag를 지정하여 사용할 수 있습니다.

#### Accessing Module Output Values

> 모듈에 정의된 리소스는 캡슐화 되므로 호출 모듈은 해당 속성에 직접 액세스 할 수 없습니다.  
> 그러나 자식 모듈은 출력값을 선언하여 호출 모듈이 액세스할 특정값을 선택적으로 내보낼 수 있습니다.

```hcl
resource "aws_elb" "example" {
  // ...

  instances = module.servers.instance_ids
}
```

#### Module Sources

> 모듈 블록의 소스 인수는 Terraform에게 원하는 하위 모듈의 소스 코드를 찾을 수 있는 위치를 알려줍니다.  
> Terraform은 terraform init의 모듈 설치 단계에서 이를 사용하여 소스 코드를 로컬 디스크의 디렉토리에 다운로드하여 다른 Terraform 명령에서 사용할 수 있도록 합니다.  
> 모듈 설치 프로그램은 아래 나열된 다양한 소스 유형에서 설치를 지원합니다.

##### Local paths

> 로컬 경로 참조를 사용하면 단일 소스 리포지토리 내 구성의 일부를 가져올 수 있습니다.

```hcl
module "consul" {
  source = "./consul"
}
```

##### GitHub

> Terraform은 접두사가 없는 github.com URL을 인식하여 자동으로 Git 리포지토리 소스로 해석합니다.

```hcl
module "consul" {
  source = "github.com/hashicorp/example"
}
```

> SSH를 통해 복제하려면 다음 형식을 사용하십시오.

```hcl
module "consul" {
  source = "git@github.com:hashicorp/example.git"
}
```

##### Generic Git, Mercurial repositories

> 임의의 Git 리포지토리는 주소 앞에 특수한 git:: 접두사를 붙여서 사용할 수 있습니다. HTTPS 또는 SSH를 사용하려면 다음의 방법을 사용하십시오.

```hcl
module "vpc" {
  source = "git::https://example.com/vpc.git"
}

module "storage" {
  source = "git::ssh://username@example.com/storage.git"
}
```

##### S3 buckets

> 특수한 s3:: 접두어와 경로 스타일 S3 버킷 객체 URL을 사용하여 S3에 저장된 아카이브를 모듈 소스로 사용할 수 있습니다.

```hcl
module "consul" {
  source = "s3::https://s3-ap-northeast-2.amazonaws.com/examplecorp-terraform-modules/vpc.zip"
}
```

#### Module Composition

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

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Data_Sources/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/08_Settings/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
