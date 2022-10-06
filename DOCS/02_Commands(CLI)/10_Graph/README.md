### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md>) / [05.Graph](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_Graph/README.md>)

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
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Output/README.md">Output</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Providers/README.md">Providers</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_State/README.md">State</a>
    │               ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Graph/README.md">Graph</a></b></i>
    │               └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_Environment_Variables/README.md">Environment_Variables</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
</pre>

### Graph

> terraform graph 명령은 구성 또는 실행 계획의 시각적 표현을 생성하는데 사용됩니다. 출력은 DOT 형식이며, GraphViz에서 차트를 생성하는데 사용할 수 있습니다.

#### Usage

```
terraform graph [options] [dir]
```

> Terraform 리소스의 시각적 종속성 그래프를 출력합니다.
> 그래포는 DOT 형식으로 출력됩니다. 이 형식을 읽을수 있는 일반적인 프로그램은 GraphViz이지만 이 형식을 읽을수 있는 웹 서비스도 있습니다.

#### Generating Images

```
terraform graph | dot -Tpng > graph.png
terraform graph | dot -Tsvg > graph.svg
```

#### Options

> -plan=tfplan  
> 현재 디렉터리의 구성 대신 지정된 계획 파일을 사용하여 그래프를 렌더링합니다.

> -draw-cycles  
> 그래프에서 색상의 모서리가 있는 모든 주기를 강조 표시합니다. 이는 사이클 오류를 진단하는 데 도움이 됩니다.

> -type=plan  
> 출력할 그래프 유형입니다. plan, plan-refresh-only, plan-destroy, 또는 apply 등 모두 가능합니다. 기본적으로 Terraform은 "plan"을 선택하거나, -plan=... 옵션도 설정한 경우 "apply"를 선택합니다.

> -module-depth=n  
> (추천되지 않음) 이전 버전의 Terraform에서는 출력에 표시할 모듈의 깊이를 지정했습니다.

---

### [이전 페이지](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/04_FMT/README.md>)

### [다음 페이지](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md>)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
