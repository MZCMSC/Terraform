### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [04.Provisioners](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md) / [01.Provisioner Connection Settings](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/01_Provisioner_Connection_Settings/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Providers/README.md">Providers</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md">Provisioners</a>
    │              ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/01_Provisioner_Connection_Settings/README.md">Provisioner_Connection_Settings</a></b></i>
    │              └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/02_Provisioner_without_a_Resource/README.md">Provisioner_without_a_Resource</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md">Modules</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md">Functions</a>
</pre>

### Provisioner Connection Settings

> 대부분의 프로 비져는 SSH 또는 WinRM을 통해 원격 리소스에 액세스 해야하며 연결 방법에 대한 세부 정보가 포함된 중첩된 연결 블록이 필요합니다.

#### Example

```hcl
# Copies the file as the root user using SSH
provisioner "file" {
  source      = "conf/myapp.conf"
  destination = "/etc/myapp.conf"
  connection {
    type     = "ssh"
    user     = "root"
    password = "${var.root_password}"
    host     = "${var.host}"
  }
}
```

---

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/02_Provisioner_without_a_Resource/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
