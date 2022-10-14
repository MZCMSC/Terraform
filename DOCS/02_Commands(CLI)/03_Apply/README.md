### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md) / [03.Apply](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/03_Apply/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/01_Init/README.md">Init</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/02_Plan/README.md">Plan</a>
    │               ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/03_Apply/README.md">Apply</a></b></i>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/04_Destroy/README.md">Destroy</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_FMT/README.md">FMT</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md">Import</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Output/README.md">Output</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Providers/README.md">Providers</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_State/README.md">State</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Graph/README.md">Graph</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_Environment_Variables/README.md">Environment_Variables</a>
    │               └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/12_Show/README.md">Show</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>
</pre>


_**==00==**_

### Apply

> terraform apply 명령은 원하는 구성 상태에 도달하는데 필요한 변경사항 또는 terraform plan 실행 계획에 의해 생성된 사전 결정된 조치 세트를 적용하는데 사용됩니다.

#### Usage

```
terraform apply [options] [dir-or-plan]
```

> 기본적으로 apply는 구성에 대한 현재 디렉토리를 스캔하고 변경 사항을 적절하게 적용합니다.

#### Options

> -auto-approve  
> 적용하기 전에 plan의 대화형 승인을 건너뜁니다.

> -backup=path  
> 수정하기 전에 기존 상태 파일을 백업할 경로입니다. 기본적으로 확장명이 ".backup"인 "-state-out" 경로로 설정됩니다. 백업을 비활성화 하려면 "-"로 설정합니다.

> -compact-warnings  
> Terraform에서 오류를 동반하지 않는 경고를 생성하는 경우 요약 메시지만 포함된 보다 간결한 형태로 경고를 표시합니다.

> -lock=false  
> 작업 중에는 상태 잠금을 유지하지 마십시오.  
> 다른 사용자가 동일한 작업 영역에 대해 명령을 동시에 실행할 수 있는 경우 이 문제가 발생할 수 있습니다.

> -lock-timeout=0s  
> 상태 잠금을 재시도하는 기간입니다.

> -input=true  
> 직접 설정되지 않은 경우 변수에 대한 입력을 요청합니다.

> -no-color  
> 지정한 경우 출력에 색상이 포함되지 않습니다.

> -parallelism=n  
> 병렬 리소스 작업 수를 제한합니다. 기본값은 10입니다.

> -state=path  
> 상태 읽기 및 저장 경로입니다(상태 초과가 지정되지 않은 경우). 기본값은 "terraform.tfstate"입니다.

> -state-out=path  
> 쓰기 상태에 대한 경로가 "-상태"와 다릅니다. 이것은 오래된 상태를 보존하는 데 사용될 수 있다.

> -var 'foo=bar'  
> Terraform 구성에서 변수를 설정합니다. 이 플래그는 여러 번 설정할 수 있습니다.  
> 변수 값은 HCL로 해석되므로 이 플래그를 통해 목록 및 맵 값을 지정할 수 있습니다.

> -var-file=foo  
> Terraform 구성의 변수를 변수 파일에서 설정합니다.  
> Terraform.tfvars 또는 .auto.tfvars 파일이 현재 디렉토리에 있으면 자동으로 로드됩니다. 이 플래그는 여러 번 사용할 수 있습니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/02_Plan/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/04_Destroy/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
