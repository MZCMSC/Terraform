### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [02.Syntax](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Syntax/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Files_and_Directories/README.md">Files_and_Directories</a>
    │                        ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Syntax/README.md">Syntax</a></b></i>
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
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>
</pre>

---

> 테라폼 언어 설명서의 대부분은 언어의 실제 사용법과 그 언어가 사용하는 특정 구조에 초점을 맞추고 있다. 이 섹션의 페이지는 테라폼 언어에 대한 보다 추상적인 뷰를 제공합니다.

#### Argument and Blocks

> 테라폼 언어 구문은 두 가지 주요 구문 구조인 인수와 블록을 중심으로 구축된다.

##### Arguments

> 인수는 특정 이름에 값을 할당합니다.

```
image_id = "abc123"
```

> 등호 앞의 식별자는 인수 이름이고 등호 뒤의 식은 인수 값 입니다.

> 인수가 나타나는 컨텍스트에 따라 유효한 값 유형이 결정되지만(예를 들어 각 리소스 유형에는 인수의 유형을 정의하는 스키마가 있음),  
> 많은 인수는 임의의 식을 허용하며, 이를 통해 값을 문자 그대로 지정하거나 다른 값에서 프로그래밍 방식으로 생성할 수 있습니다.

> ※ Note: 테라포름의 구성 언어는 HCL이라는 더 일반적인 언어에 기반을 두고 있으며, HCL의 문서에서는 보통 "argument" 대신 "attribute"라는 단어를 사용한다. 이 단어들은 이러한 맥락에서 상호 교환이 가능할 정도로 유사하며, 숙련된 테라폼 사용자는 일상적인 대화에서 두 가지 용어를 사용할 수 있다. 그러나 Terraform은 또한 "속성"이라고 불리는 몇 가지 다른 것들과 상호작용하기 때문에(특히 Terraform 리소스는 표현식에서 참조할 수 있지만 구성에서는 값을 할당할 수 없는 ID와 같은 속성을 가지고 있다), 우리는 이 구문 구조를 언급할 때 Terraform 문서에서 "인수"를 사용하기로 결정했다.

##### Blocks

> 블록은 다른 콘텐츠에 대한 컨테이너입니다.

```
resource "aws_instance" "example" {
  ami = "abc123"
  network_interface {
    # ...
  }
}
```

> 블록에는 유형(이 예에서는 리소스)이 있습니다. 각 블록 유형은 type 키워드를 따라야 하는 레이블 수를 정의합니다. 리소스 블록 유형에는 aWS_instance와 위의 예제의 두 가지 레이블이 필요합니다. 특정 블록 유형에는 필요한 레이블이 얼마든지 있거나 중첩된 network_interface 블록 유형처럼 레이블이 필요하지 않을 수 있습니다.

> 블록 유형 키워드 및 레이블 뒤에는 블록 본문이 { and }자로 구분됩니다. 블록 본문 내에서 추가 인수와 블록이 중첩되어 블록 및 관련 인수의 계층 구조를 만들 수 있습니다.

> Terraform 언어는 제한된 수의 최상위 블록 유형을 사용하며, 이는 구성 파일의 다른 블록 외부에 나타날 수 있는 블록입니다. 테라폼의 대부분의 기능(자원, 입력 변수, 출력 값, 데이터 소스 등)은 최상위 블록으로 구현됩니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Files_and_Directories/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Resources/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)