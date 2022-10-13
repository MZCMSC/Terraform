### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [07.Output Values](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Output_Values/README.md)

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
    │                        ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Output_Values/README.md">Output_Values</a></b></i>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/08_Local_Values/README.md">Local_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/09_Modules/README.md">Modules</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/10_Expressions/README.md">Expressions</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/README.md">Functions</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/12_Settings/README.md">Settings</a>
    │                        └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/README.md">State</a>  
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>
</pre>

---

### Output Values

> Output Value는 Terraform 모듈의 반환 값과 유사하며 여러 용도로 사용됩니다.

#### Declaring an Output Value

> Output 블록을 사용 하여 설정합니다.

```hcl
output "private_ip" {
  description = "The private IP address of the main server instance."
  value       = aws_instance.server.private_ip

  depends_on = [
    aws_security_group_rule.local_access,
  ]
}

output "db_password" {
  description = "The password for logging in to the database."
  value       = aws_db_instance.db.password
  sensitive   = true
}
```

> description 인수를 사용하여 각 값의 목적을 간단히 설명 할 수 있습니다.

> value 인수는 결과가 사용자에게 리턴되는 표현식을 사용합니다.

> sensitive 출력값을 마스킹 할 수 있습니다.

> depends_on 출력 값은 모듈에서 데이터를 전달하는 수단 일 뿐이므로 일반적으로 종속성 그래프에서 다른 노드와의 관계에 대해 걱정할 필요가 없습니다.

> 그러나 상위 모듈이 하위 모듈 중 하나에서 내 보낸 출력 값에 액세스 할 때 해당 출력 값의 종속성을 통해 Terraform은 다른 모듈에 정의 된 리소스 간의 종속성을 올바르게 결정할 수 있습니다.

#### Accessing Child Module Outputs

> 상위 모듈에서 하위 모듈의 출력은 module.<MODULE NAME>.<OUTPUT NAME>로 표현할 수 있습니다.  
> 예를 들어, server라는 하위 모듈이 private_ip라는 출력을 선언 한 경우 해당 값에 module.server.private_ip로 액세스할 수 있습니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Input_Variables/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/08_Local_Values/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
