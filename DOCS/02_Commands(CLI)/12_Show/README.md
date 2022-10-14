### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md) / [12.Show](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/12_Show/README.md)

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
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md">Import</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Output/README.md">Output</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Providers/README.md">Providers</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_State/README.md">State</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Graph/README.md">Graph</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_Environment_Variables/README.md">Environment_Variables</a>
    │               └── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/12_Show/README.md">Show</a></b></i>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>
</pre>

### State

> terraform show 명령은 상태 또는 계획 파일에서 사람이 읽을 수 있는 출력을 제공하는 데 사용됩니다.
> 이를 통해 계획된 작업이 예상되는지 확인하기 위해 계획을 검사하거나 Terraform이 보는 대로 현재 상태를 검사할 수 있습니다.

#### JSON Output

> Terraform state file(path가 제공되지 않은 경우 포함)의 경우, Terraform show -json은 상태를 JSON으로 표시합니다.

> Terraform plan file의 경우 terraform show -json은 plan, configuration 및 현재 state를 JSON으로 표시합니다.

> State가 작성된 이후 새 schema 버전이 포함된 공급자를 업데이트한 경우 상태를 업그레이드해야 show -json으로 표시할 수 있습니다. plan을 보고 있는 경우 -refresh=false 없이 계획을 생성해야 합니다. State 파일을 보는 경우 먼저 terraform refresh를 실행하십시오.


> 출력 형식은 JSON 출력 형식에서 자세히 다룹니다.

#### Usage

> Usage: terraform show [options] [file]

> Terraform state file 또는 plan file에 대한 경로와 함께 show를 사용할 수 있습니다. 파일 경로를 지정하지 않으면 Terraform에 최신 상태 스냅샷이 표시됩니다.


> 이 명령은 다음 옵션을 사용할 수 있습니다.

> -no-color
> 색상으로 출력을 비활성화합니다.

> - json
> 상태 또는 계획 파일에서 시스템이 읽을 수 있는 출력을 표시합니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_Environment_Variables/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
