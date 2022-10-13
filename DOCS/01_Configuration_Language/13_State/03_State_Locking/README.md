### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [13.State](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/README.md) / [03.State Locking](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/03_State_Locking/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Files_and_Directories/README.md">Files_and_Directories</a>
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
    │                                                   ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/01_Purpose_of_Terraform_State/README.md">Purpose_of_Terraform_State</a>
    │                                                   ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/02_Remote_State/README.md">Remote_State</a>
    │                                                   └── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/03_State_Locking/README.md">State_Locking</a></b></i>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>
</pre>

---

### State Locking

> 백엔드에서 지원하는 경우 Terraform은 상태를 기록할 수 있는 모든 작업에 대해 상태를 잠급니다. 이렇게하면 다른 사람이 잠금을 획득하여 잠재적으로 상태를 손상시킬 수 없습니다. 상태 잠금은 상태를 기록할 수 있는 모든 작업에서 자동을 발생합니다. -lock 플래그를 사용하여 대부분의 명령에 대해 상태 잠금을 비활성화 할 수 있지만 권장되지는 않습니다.

#### Force Unlock

> Terraform에는 잠금 해제에 실패할 경우 상태를 수동으로 잠금 해제하는 force-unlock 명령이 있습니다.

> 이 명령을 사용할 때는 매우 주의하십시오. 다른 사용자가 잠금을 보유하고 있을 때 상태 잠금을 해제하면 여러 작성자가 발생할 수 있습니다. 강제 잠금 해제 기능은 자동 잠금 해제에 실패한 상황에서 자신의 잠금 해제에만 사용해야 합니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/02_Remote_State/README.md))

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
