### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md"><i><b>Configuration Language</b></i></a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
</pre>


---

## 01. Configuration Language

> Terraform 언어의 주요 목적은 인프라 개체를 나타내는 리소스 를 선언하는 것입니다. 다른 모든 언어 기능은 리소스 정의를 보다 유연하고 편리하게 만들기 위해서만 존재합니다.

#### Arguments, Blocks, and Expressions

```hcl
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}

BLOCK_TYPE "BLOCK_LABEL" "BLOCK_LABEL" {
  // Block body
IDENTIFIER = EXPRESSION # Argument
}
```

- Block은 다른 내용의 컨테이너이며 일반적으로 리소스와 같은 일종의 개체 구성을 나타냅니다. 블록은 Block Type을 가지며 0개 이상의 Label을 가질 수 있으며 여러 개의 인수와 중첩 된 블록을 포함하는 본문을 갖습니다.
- Argument는 이름에 값을 할당합니다. 그것들은 Block 안에 작성합니다.
- Expression은 문자 그대로 또는 다른 값을 참조하고 결합하여 값을 나타냅니다. 인수의 값으로 또는 다른 표현식 내에 나타납니다.

<!-- 
#### Code Organization

> Terraform은 확장자가 .tf인 파일을 사용합니다.  
> Json 기반일 경우 .tf.json을 사용합니다.  
> 모듈은 하나의 디렉토리에 포함된 테라폼 파일의 모음입니다.  
> 루트 모듈은 테라폼이 실행될 때 현재 작업의 디렉토리의 구성 파일에서 빌드 되며 이 모듈은 다른 디렉토리의 하위 모듈을 참조 할 수 있으며, 다른 모듈 등을 참조 할 수 있습니다.

#### Configuration Ordering

> 일반적으로 Terraform의 블록 순서는 중요하지 않습니다.  
> 구성의 정의 관계에 따라 리소스를 자동으로 처리합니다.

#### Terraform CLI vs Providers

> Terraform CLI는 Terraform 구성을 평가하고 적용하기 위한 엔진입니다.  
> Terraform 언어 구문과 전체 구조를 정의하고 원격 인프라가 주어진 구성과 일치하도록 변경 순서를 조정합니다.  
> Terraform은 각각 일련의 리소스 유형을 정의하고 관리하는 Provider 라는 플러그인을 사용합니다.  
> 대부분의 Provider는 특정 클라우드 또는 On-premise 인프라 서비스와 연결되어 있으므로 Terraform은 해당 서비스 내에서 인프라 개체를 관리할 수 있습니다. -->

- [Resources](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Resources/README.md)
- [Data Sources](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Data_Sources/README.md)
- [Providers](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Providers/README.md)
- [Local Values](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Local_Values/README.md)
- [Input Variables](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/05_Input_Variables/README.md)
- [Output Values](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Output_Values/README.md)
- [Modules](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Modules/README.md)
- [Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/08_Functions/README.md)
- [Settings](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/09_Settings/README.md)
- [State](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/10_State/README.md)
- [Syntax](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Syntax/README.md)

---

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
