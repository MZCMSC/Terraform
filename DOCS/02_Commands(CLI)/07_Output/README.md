### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md>) / [08.Output](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Output/README.md>)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)></a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/01_Init/README.md">Init</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/02_Plan/README.md">Plan</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/03_Apply/README.md">Apply</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/04_Destroy/README.md">Destroy</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_FMT/README.md">FMT</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md">Import</a>
    │               ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Output/README.md">Output</a></b></i>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Providers/README.md">Providers</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_State/README.md">State</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Graph/README.md">Graph</a>
    │               └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_Environment_Variables/README.md">Environment_Variables</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
</pre>

### Output

> terraform output 명령은 상태 파일에서 출력 변수의 값을 추출하는데 사용됩니다.

#### Usage

```
Terraform output [options] [NAME]
```

#### Options

> -json - 지정된 경우 기계 판독 가능한 출력이 JSON 형식으로 인쇄됩니다. NAME을 정하면 지정된 출력만 반환됩니다. 추가 처리를 위해 jq와 같은 도구에 파이프로 연결할 수 있습니다.

> -state=path  
> 읽을 상태 파일의 경로입니다. 기본값은 "terraform.tfstate"입니다.

> -no-color  
> 지정한 경우 출력에 색상이 포함되지 않습니다.

> -raw  
> 문자열로 자동 변환할 수 있는 값 유형의 경우 에서는 원시 문자열을 인간 중심의 값 표현이 아닌 직접 인쇄합니다.

---

### [이전 페이지](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Init/README.md>)

### [다음 페이지](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_Plan/README.md>)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
