### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [08.Settings](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Settings/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Resources/README.md">Resources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Data_Sources/README.md">Data_Sources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Providers/README.md">Providers</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Local_Values/README.md">Local_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/05_Input_Variables/README.md">Input_Variables</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Output_Values/README.md">Output_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Modules/README.md">Modules</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/08_Settings/README.md"><i><b>Settings</b></i></a>
    │                        └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/09_Syntax/README.md">Syntax</a>  
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>  
</pre>

---

> 특수 테라폼 구성 블록 유형은 구성을 적용하기 위해 최소 테라폼 버전이 필요한 경우와 같이 테라폼 자체의 일부 동작을 구성하는 데 사용됩니다.

#### Terraform Block Syntax

> 테라폼 설정이 함께 테라폼 블록으로 모입니다.

```
terraform {
  # ...
}
```

> 각 테라폼 블록에는 테라폼의 동작과 관련된 여러 설정이 포함될 수 있습니다. 인수는 자원, 입력 변수 등과 같은 명명된 객체를 참조할 수 없으며 테라폼 언어 내장 함수를 사용할 수 없습니다.

> 테라폼 블록 내에서 지원되는 다양한 옵션은 다음 절에서 설명합니다.

#### Specifying Provider Requirements

> required_providers 블록은 현재 모듈에 필요한 모든 공급자를 지정하고 각 로컬 공급자 이름을 소스 주소 및 버전 제약 조건에 매핑합니다.

```
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}
```

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Modules/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/09_Syntax/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)