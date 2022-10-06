### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [01.Input Variables](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Input_Variables/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Resources/README.md">Resources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Data_Sources/README.md">Data_Sources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Providers/README.md">Providers</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Local_Values/README.md">Local_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/05_Input_Variables/README.md"><i><b>Input_Variables</b></i></a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Output_Values/README.md">Output_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Modules/README.md">Modules</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/08_Settings/README.md">Settings</a>
    │                        └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/09_Syntax/README.md">Syntax</a>  
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>  
</pre>

---

### Input Variables

> Input Variable은 Terraform 모듈의 매개 변수 역할을 하며, 다른 모듈 간에 매개 변수를 공유 할 수 있습니다.

#### Declaring an Input Variable

> Variable 블록을 사용하여 설정 합니다.

```hcl
variable "ami_id" {
  description = "The id of the machine image (AMI)."
  type        =string
  }

variable "availability_zone_names" {
  type    = list(string)
  default = [
    "ap-northeast-2a",
    "ap-northeast-2b",
  ]
}

variable "docker_ports" {
  type = list(object({
    internal =number
    external =number
    protocol =string
  }))
  default =[
    {
      internal =8300
      external =8300
      protocol ="tcp"
      }
  ]
}
```

> Description 인수를 사용하여 각 값의 목적을 간단히 설명 할 수 있습니다.  
> Type 인수를 사용하면 변수 값으로 허용되는 타입을 제한 할 수 있습니다.  
> 타입이 설정되지 않은 경우 모든 유형의 값이 허용됩니다.  
> Default 인수를 선언하면 해당 인수를 선언 하지 않았을때 정의된 값을 사용 합니다.  
>  하지만 선언 하지 않으면 해당 값은 필수가 됩니다.

#### Using Input Variable Values

> 변수를 선언한 모듈 내에서 표현식 내에서 var.<NAME>으로 값에 액세스 할 수 있습니다.

```hcl
resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = var.ami_id
 }
```

---

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Providers/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
