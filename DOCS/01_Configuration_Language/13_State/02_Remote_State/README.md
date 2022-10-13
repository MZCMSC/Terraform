### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [13.State](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/README.md) / [02.Remote State](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/02_Remote_State/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Files_and_Directories/README.md">Files_and_Directories</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Syntax/README.md">Syntax</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Resources/README.md">Resources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Data_Sources/README.md">Data_Sources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/05_Providers/README.md">Providers</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Input_Variables/README.md">Input_Variables</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Output_Values/README.md">Output_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/08_Local_Values/README.md">Local_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/09_Modules/README.md">Modules</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/10_Expressions/README.md">Expressions</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/README.md">Functions</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/12_Settings/README.md">Settings</a>
    │                        └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/README.md">State</a>  
    │                                                   ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/01_Purpose_of_Terraform_State/README.md">Purpose_of_Terraform_State</a>
    │                                                   ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/02_Remote_State/README.md">Remote_State</a></b></i>
    │                                                   └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/03_State_Locking/README.md">State_Locking</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>
</pre>

---

### Remote State

> 기본적으로 Terraform은 terraform.tfstate 라는 파일에 상태를 로컬로 저장합니다. 팀에서 Terraform으로 작업할 때 로컬 파일을 사용하면 각 사용자가 Terraform을 실행하기 전에 항상 최신 상태 데이터를 가지고 있는지 확인하고 동시에 다른 사람이 Terraform을 실행하지 않도록 해야하므로 Terraform 사용이 복잡해집니다.

> 원격 상태에서 Terraform은 상태 데이터를 원격 데이f터 저장소에 기록한 다음 팀의 모든 구성원 간에 공유할 수 있습니다. Terraform은 Terraform Cloud, HashiCorp Consul, Amazon S3, Alibaba Cloud OSS 등의 상태 저장을 지원합니다.

#### Delegation and Teamwork

> 원격 상태는 더 쉬운 버전 제어 및 안전한 저장 이상을 제공합니다. 또한 출력을다른 팀에 위임 할 수도 있습니다. 이를 통해 인프라를 여러 팀이 액세스 할수 있는 구성 요소로 보다 쉽게 분류 할 수 있습니다.

> 다시 말해 원격 상태를 통해 팀은 추가 구성 장소에 의존하지 않고 인프라 리소스를 읽기 전용 방식으로 공유할 수 있습니다.

#### Locking and Teamwork

> 완벽한 기능을 갖춘 원격 백엔드의 경우 Terraform은 상태 잠금을 사용하여 동일한 상태에 대한 Terraform의 동시 실행을 방지할 수 있습니다.

#### Example

```hcl
terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket ="terraform-mz-seoul"
    key    ="vpc-demo.tfstate"
  }
}
module "vpc" {
  source = "github.com/nalbam/terraform-aws-vpc?ref=v0.12.24"

  region = var.region
  name   =var.name
}
```

```hcl
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-mz-seoul"
    key    = "vpc-demo.tfstate"
  }
}

module "eks" {
  source     = "github.com/nalbam/terraform-aws-eks?ref=v0.12.32"

  region     = var.region
  name       = var.name

  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.subnet_ids
}
```

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/01_Purpose_of_Terraform_State/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/03_State_Locking/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
