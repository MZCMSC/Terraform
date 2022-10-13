### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [01.Files and Directories](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Files_and_Directories/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Files_and_Directories/README.md">Files_and_Directories</a></b></i>
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
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>
</pre>

---

### Files and Directories



#### File Extension

> Terraform 언어의 코드는 .tf 파일 확장자를 가진 일반 텍스트 파일로 저장된다.
> .tf.json 파일 확장자로 이름이 붙여진 언어의 JSON 기반 변형도 있다.
> Terraform 코드가 포함된 파일을 Configuration File이라고 한다.

#### Text Encoding

> Configuration File은 항상 UTF-8 인코딩을 사용해야 하며 둘 모두 accept 되더라도 일반적으로 윈도우 스타일 라인 엔딩(CRLF)이 아닌 유닉스 스타일 라인 엔딩(LF)을 사용한다.

#### Directories and Modules

> 모듈은 디렉토리에 함께 보관된 .tf 혹은 .tf.json 파일의 모음이다.

> Terraform 모듈은 디렉토리의 최상위 구성 파일로만 구성되며, 중첩된 디렉토리는 완전히 별도의 모듈로 처리되며 구성에 자동으로 포함되지 않는다.

> Terraform은 모듈의 모든 구성 파일을 평가하여 전체 모듈을 단일 문서로 효과적으로 처리한다. 다양한 블록을 서로 다른 파일로 분리하는 것은 순전히 독서자와 유지보수의 편의를 위한 것이며 모듈의 동작에 영향을 미치지 않는다.

> Terraform 모듈은 모듈 호출을 사용하여 구성에 다른 모듈을 명시적으로 포함할 수 있다. 이러한 하위 모듈은 로컬 디렉토리(parent module의 디렉토리 또는 디스크의 다른 위치에 중첩됨) 또는 Terraform Registry와 같은 외부 원본에서 가져올 수 있다.

#### The Root Module

> Terraform은 항상 단일 루트 모듈의 컨텍스트에서 실행된다. 전체 Terraform 구성은 루트 모듈과 하위 모듈 트리(루트 모듈이 호출하는 모듈, 해당 모듈이 호출하는 모듈 등)로 구성된다.

- Terraform CLI에서 루트 모듈은 Terraform이 호출되는 작업 디렉토리이다. (command line option을 사용하여 작업 디렉토리 외부에 루트 모듈을 지정할 수 있지만 실제로 이런일은 드물다.)
- Terraform Cloud and Terraform Enterprise에서 작업영역의 루트 모듈은 기본적으로 구성 디렉토리의 최상위 수준(버전 제어 리포지토리 또는 직접 업로드를 통해 제공됨)으로 설정되지만 작업영역 설정은 대신 사용할 하위 디렉토리를 지정할 수 있다.

---

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Syntax/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)