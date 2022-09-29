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

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Data_Sources/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
