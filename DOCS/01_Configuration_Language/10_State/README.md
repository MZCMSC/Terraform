### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [03.State](https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md"><i><b>State</b></i></a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
</pre>

---

## 06. State

> Terraform은 인프라 및 구성에 대한 상태를 저장해야 합니다.
> 이 상태는 Terraform에서 실제 리소스를 구성에 매핑하고 메타 데이터를 추적하며 대규모 인프라의 성능을 향상 시키는데 사용 됩니다.
> 이 상태는 기본적으로 terraform.tfstate 라는 로컬 파일에 저장되지만 원격으로 저장할 수도 있으므로 팀 환경에서 더 잘 작동합니다.

- [Purpose of Terraform State](https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/01_Purpose_of_Terraform_State/README.md)
- [Remote State](https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/02_Remote_State/README.md)
- [State Locking](https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/03_State_Locking/README.md)

Terraform은 관리되는 인프라 및 구성에 대한 상태를 저장해야 합니다. 이 상태는 Terraform에서 실제 리소스를 구성에 매핑하고 메타데이터를 추적하며 대규모 인프라의 성능을 향상시키는 데 사용됩니다.

## State는 기본적으로 "terraform.tfstate"라는 이름의 로컬 파일에 저장되지만 원격으로 저장할 수도 있어 팀 환경에서 더 잘 작동합니다.

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
