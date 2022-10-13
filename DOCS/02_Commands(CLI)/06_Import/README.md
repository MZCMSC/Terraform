### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md) / [06.Import](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/01_Init/README.md">Init</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/02_Plan/README.md">Plan</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/03_Apply/README.md">Apply</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/04_Destroy/README.md">Destroy</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_FMT/README.md">FMT</a>
    │               ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md">Import</a></b></i>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Output/README.md">Output</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Providers/README.md">Providers</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_State/README.md">State</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Graph/README.md">Graph</a>
    │               └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_Environment_Variables/README.md">Environment_Variables</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
</pre>

### Import

> terraform import 명령은 기존 리소스를 Terraform으로 가져 오는데 사용됩니다.

#### Usage

```
terraform import [options] ADDRESS ID
```

> Import는 ID에서 기존 리소스를 찾아 주어진 ADDRESS에 Terraform 상태로 가져옵니다.
> ADDRESS는 유효한 리소스 주소여야 합니다. 모든 자원 주소가 유효하기 때문에 import 명령은 자원을 모듈로 가져오거나 상태의 루트로 직접 가져올 수 있습니다.

> ID는 가져오는 자원유형에 따라 다릅니다. 예를들어 AWS 인스턴스의 경우 인턴스 ID (i-abcd1234)이지만 AWS Route53 영역의 경우 영역 ID (Z12ABC4UGMOZ2N)입니다. ID 형식에 ㅐ한 자세한 내용은 제공 업체 설명서를 참조하십시오. 확실하지 않은 경우 ID를 사용해 보십시오. ID가 유효하지 않으면 오류 메시지만 표시됩니다.

#### Example: Import into Resource

> 이 예제는 AWS 인스턴스를 foo라는 aws_instance 리소스로 가져옵니다.

```
terraform import aws_instance.foo i-abcd1234
```

#### Example: Import into Module

> 아래 예제는 AWS 인스턴스를 bar라는 aws_instance 리소스로 foo라는 모듈로 가져옵니다.

```
terraform import module.foo.aws_instance.bar i-abcd1234
```

#### Example: Import into Resource configured with count

> 아래 예제는 인스턴스를 count로 구성된 baz라는 aws_instance 리소스의 첫번째 인스턴스로 가져옵니다.

```
terraform import 'aws_instance.baz[0]' i-abcd1234
```

#### Options

> -config=path  
> 공급자를 구성하는 데 사용할 Terraform 구성 파일의 디렉터리 경로입니다. 기본값은 pwd입니다. 구성 파일이 없는 경우 입력 프롬프트 또는 환경을 통해 제공해야 합니다.

> -allow-missing-config  
> 리소스 구성 블록이 없는 경우 가져오기를 허용합니다.

> -input=false  
> 대화형 입력 프롬프트를 비활성화합니다.

> -lock=false  
> 작업 중에는 상태 잠금을 유지하지 마십시오. 다른 사용자가 동일한 작업 영역에 대해 명령을 동시에 실행할 수 있는 경우 이 문제가 발생할 수 있습니다.

> -lock-timeout=0s  
> 상태 잠금을 재시도하는 기간입니다.

> -no-color  
> 지정한 경우 출력에 색상이 포함되지 않습니다.

> -var 'foo=bar'  
> Terraform 구성에서 변수를 설정합니다. 이 플래그는 여러 번 설정할 수 있습니다. 이 기능은 "-config" 플래그에서만 유용합니다.

> -var-file=foo  
> Terraform 구성에서 변수를 설정합니다. 이 플래그는 여러 번 설정할 수 있습니다. 이 기능은 "-config" 플래그에서만 유용합니다.

> -ignore-remote-version  
> 원격 백엔드에만 사용되는 희귀 옵션입니다. 자세한 내용은 원격 백엔드 설명서를 참조하십시오.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_FMT/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Output/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
