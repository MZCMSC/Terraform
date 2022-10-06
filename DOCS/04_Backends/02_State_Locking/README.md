### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [04.Backends](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md) / [02.State Locking](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/02_State_Locking/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md"><i><b>Backends</b></i></a>
    │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/01_Backends_Configuration/README.md">Remote_State</a>
    │           └── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/02_State_Locking/README.md">State_Locking</a></b></i>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
</pre>

### Locking

> 백엔드는 상태를 저장하고 상태 잠금을 위한 API를 제공합니다. 상태 잠금은 선택 사항입니다.  
> 아래는 Amazon S3를 원격 상태 저장소로 사용하고, DynamoDB를 잠금 기능으로 선언한 예시 코드입니다.

```hcl
terraform {
  backend "s3" {
    region         ="ap-northeast-2"
    bucket         ="terraform-mz-seoul"
    key            ="vpc-demo.tfstate"
    dynamodb_table ="terraform-mz-seoul"
    encrypt        =true
  }
}
```

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/01_Backends_Configuration/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
