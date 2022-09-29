### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md>)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md"><i><b>Commands(CLI)</b></i></a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Providers/README.md">Providers</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md">Provisioners</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md">Modules</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md">Functions</a>
</pre>

---

## 02. Commands(CLI)

> Terraform은 명령 줄 인터페이스 (CLI)를 통해 제어됩니다.
> Terraform은 단일 명령 행 애플리케이션 인 terraform 입니다. 그리고 apply 또는 plan과 같은 하위 명령을 사용합니다.
> Terraform 명령을 실행하면 다음과 같은 설명이 출력 됩니다.

```
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.

Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
    env                Workspace management
    fmt                Rewrites config files to canonical format
    get                Download and install modules for the configuration
    graph              Create a visual graph of Terraform resources
    import             Import existing infrastructure into Terraform
    init               Initialize a Terraform working directory
    output             Read an output from a state file
    plan               Generate and show an execution plan
    providers          Prints a tree of the providers used in the configuration
    refresh            Update local state file against real resources
    show               Inspect Terraform state or plan
    taint              Manually mark a resource for recreation
    untaint            Manually unmark a resource as tainted
    validate           Validates the Terraform files
    version            Prints the Terraform version
    workspace          Workspace management
All other commands:
    0.12upgrade        Rewrites pre-0.12 module source code for v0.12
    debug              Debug output management (experimental)
    force-unlock       Manually unlock the terraform state
    push               Obsolete command for Terraform Enterprise legacy (v1)
    state              Advanced state management
```

- [Environment Variables](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/01_Environment_Variables/README.md>)
- [Apply](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/02_Apply/README.md>)
- [Destroy](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/03_Destroy/README.md>)
- [Fmt](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/04_FMT/README.md>)
- [Graph](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_Graph/README.md>)
- [Import](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md>)
- [Init](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Init/README.md>)
- [Output](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Output/README.md>)
- [Plan](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_Plan/README.md>)
- [Providers](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Providers/README.md>)
- [State](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_State/README.md>)

---

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
