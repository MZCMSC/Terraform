### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md>) / [01.Init](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/01_Init/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    │               ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/01_Init/README.md">Init</a></b></i>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/02_Plan/README.md">Plan</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/03_Apply/README.md">Apply</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/04_Destroy/README.md">Destroy</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_FMT/README.md">FMT</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md">Import</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Output/README.md">Output</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Providers/README.md">Providers</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_State/README.md">State</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Graph/README.md">Graph</a>
    │               └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_Environment_Variables/README.md">Environment_Variables</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
</pre>

### Init

> terraform init 명령은 Terraform 구성 파일이 포함된 작업 디렉토리를 초기화 하는데 사용됩니다. 새 Terraform 구성을 작성하거나 기존 버전 구성을 버전 제어에서 복제한 후에 실행해야하는 첫번째 명령입니다. 이 명령을 여러 번 실행하는것이 안전합니다.

#### Usage

```
terraform init [options] [dir]
```

#### Options

> -backend=false  
> 이 구성에 대해 백엔드 또는 Terraform Cloud 초기화를 사용하지 않도록 설정하고 이전에 별칭으로 초기화된 것을 사용합니다. -cloud=false

> -backend-config=path  
> 구성 파일의 '백엔드' 블록에 있는 구성과 병합할 구성입니다. key/value 할당이 있는 HCL 파일 경로(terraform.tarvars와 같은 형식) 또는 'key=value' 형식 중 하나일 수 있으며 여러 번 지정할 수 있습니다. 백엔드 유형은 구성 자체에 있어야 합니다.

> -force-copy  
> 새 상태 백엔드를 초기화할 때 상태 데이터를 복사하라는 메시지를 표시하지 않습니다. 이는 모든 확인 프롬프트에 "yes"를 제공하는 것과 같습니다.

> -from-module=SOURCE  
> 초기화하기 전에 지정된 모듈의 내용을 대상 디렉터리에 복사합니다.

> -get=false  
> 이런 배치 형태에 대해 사용 안 함 다운로드 모듈이죠.

> -input=false  
> 대화형 프롬프트를 비활성화합니다. 일부 작업에는 대화형 프롬프트가 필요할 수 있으며 입력을 사용할 수 없는 경우 오류가 발생합니다.

> -lock=false  
> 백엔드 마이그레이션 중에 상태 잠금을 유지하지 마십시오. 다른 사용자가 동일한 작업 영역에 대해 명령을 동시에 실행할 수 있는 경우 이 문제가 발생할 수 있습니다.

> -lock-timeout=0s  
> 상태 잠금을 재시도하는 기간입니다.

> -no-color  
> 지정한 경우 출력에 색상이 포함되지 않습니다.

> -plugin-dir  
> 플러그인 이진 파일이 들어 있는 디렉터리입니다. 이렇게 하면 플러그인에 대한 모든 기본 검색 경로가 재정의되고 플러그인의 자동 설치가 차단됩니다. 이 플래그는 여러 번 사용할 수 있습니다.

> -reconfigure  
> 저장된 구성을 무시하고 백엔드를 재구성합니다.

> -migrate-state  
> 백엔드를 재구성하고 기존 상태 마이그레이션을 시도합니다.

> -upgrade  
> 종속성 잠금 파일에 기록된 버전을 정확하게 선택하는 기본 동작을 재정의하여 구성된 제약 조건 내에서 허용되는 최신 모듈 및 제공자 버전을 설치합니다.

> -lockfile=MODE  
> 종속성 잠금 파일 모드를 설정합니다. 현재 "readonly"만 유효합니다.

---

### [다음 페이지](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/02_Plan/README.md>)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
