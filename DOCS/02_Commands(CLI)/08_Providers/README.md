### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md>) / [10.Providers](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Providers/README.md>)

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
    │               ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Providers/README.md">Providers</a></b></i>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_State/README.md">State</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Graph/README.md">Graph</a>
    │               └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_Environment_Variables/README.md">Environment_Variables</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
</pre>

### Providers

> terraform provider 명령은 현재 구성에 사용된 제공자에 대한 정보를 출력합니다.

#### Usage

```
terraform providers [config-path]
```

#### Example

```
 .
├── provider.aws
├── provider.terraform
└── module.eks
          ├── provider.aws (inherited)
          ├── provider.kubernetes
          ├── provider.local
          └── provider.template
```

```
 .
├── provider.aws
├── provider.terraform
└── module.worker
         ├── provider.aws (inherited)
         └── module.worker
                  └── provider.aws (inherited)
```

#### subcommand

> lock 구성된 제공자에 대한 종속성 잠금 쓰기

> mirror 필요한 모든 공급자 플러그인의 로컬 복사본 저장

> schema 구성에 사용된 제공자에 대한 스키마 표시

---

### [이전 페이지](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_Plan/README.md>)

### [다음 페이지](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_State/README.md>)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
