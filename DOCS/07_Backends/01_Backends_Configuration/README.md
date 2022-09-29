### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [07.Backends](https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md) / [01.Backends Configuration](https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/01_Backends_Configuration/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Providers/README.md">Providers</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md">Provisioners</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md">Modules</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md">Backends</a>
    │           ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/01_Backends_Configuration/README.md">Remote_State</a></b></i>
    │           └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/02_State_Locking/README.md">State_Locking</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md">Functions</a>
</pre>

### Backends Configuration

> 백엔드는 terraform 섹션의 Terraform 파일에서 직접 구성됩니다. 백엔드를 구성한 후에는 terraform init을 해야합니다.

```hcl
terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-workshop-mzcdev"
    key    = "vpc.tfstate"
  }
}
```

> ※ Tip  
> 백엔드는 하나만 지정할 수 있습니다.

---

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/02_State_Locking/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
