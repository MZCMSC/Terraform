### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [04.Backends](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md"><i><b>Backends</b></i></a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
</pre>

---

## 07. Backends

> Terraform의 Backend는 State가 로드 되는 방식과 applyh와 긑은 작이 실행되는 방식을 결정합니다.

#### Benefits of backends

- 팀 협업: 상태를 원격 저장하고, 실행중 일때 상태를 잠금으로 보호하여 손상을 방지 할 수 있습니다.
- 중요한 정보 유지: 정의 하지 않을 경우 메모리에만 저장됩니다. Amazon S3와 같이 원격지에 저장 할 수 있습니다.
- 원격 운영: 대규모의 인프라의 생성 또는 변경은 작업 시간이 오래 걸릴 수 있습니다. 일부 백엔드는 원격작업을 원격에서 유지 할 수 있습니다. 원격 상태 저장소와 잠금 기능을 같이 사용 하면 팀 협업에 도움이 됩니다.
- [Backend Configuration](https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/01_Backends_Configuration/README.md)
- [State Locking](https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/02_Locking/README.md)

---

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
