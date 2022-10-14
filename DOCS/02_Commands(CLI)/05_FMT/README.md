### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md) / [05.FMT](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_FMT/README.md)

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
    │               ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_FMT/README.md">FMT</a></b></i>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md">Import</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Output/README.md">Output</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Providers/README.md">Providers</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_State/README.md">State</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Graph/README.md">Graph</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_Environment_Variables/README.md">Environment_Variables</a>
    │               └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/12_Show/README.md">Show</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>
</pre>

### FMT

> terraform rmt 명령은 Terraform 구성 파일을 표준 형식 및 스타일로 다시 쓰는데 사용됩니다. 이 명령은 Terraform 언어 스타일 규칙의 하위 집합과 함께 가독성을 위한 기타 작은 조정 사항을 적용합니다.

#### Usage

```
terraform fmt [options] [dir]
```

#### Options

> -list=false  
> 형식이 다른 파일을 나열하지 않음(STDIN을 사용하는 경우 항상 비활성화됨)

> -write=false  
> 원본 파일에 쓰지 않음(STDIN 또는 -check를 사용하는 경우 항상 비활성화됨)

> -diff  
> 서식 변경 사항의 차이 표시

> -check  
> 입력이 포맷되었는지 확인합니다. 모든 입력이 올바르게 포맷된 경우 종료 상태는 0이 되고, 그렇지 않은 경우 0이 아닙니다.

> -no-color  
> 지정한 경우 출력에 색상이 포함되지 않습니다.

> -recursive  
> 하위 디렉토리의 파일도 처리합니다. 기본적으로 지정된 디렉토리(또는 현재 디렉토리)만 처리됩니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/04_Destroy/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)

