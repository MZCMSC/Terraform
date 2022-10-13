### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [00.Terraform](https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md"><i><b>Terraform</b></i></a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>
</pre>

---

# Terraform 이란?

> HashiCorp Terraform은 버전을 지정하고 재사용하고 공유할 수 있는 사람이 읽을 수 있는 구성 파일에서 클라우드 및 온프레미스 리소스를 모두 정의할 수 있는 IaC 도구입니다.

## Terraform은 어떻게 작동합니까?

> Terraform은 API(응용 프로그래밍 인터페이스)를 통해 클라우드 플랫폼 및 기타 서비스에서 리소스를 생성하고 관리합니다.
> 제공업체를 통해 Terraform은 액세스 가능한 API를 통해 거의 모든 플랫폼 또는 서비스와 함께 작동할 수 있습니다.

> HashiCorp와 Terraform 커뮤니티는 이미 수천 가지 유형의 리소스와 서비스를 관리하기 위해 1700개 이상의 공급자를 작성했으며, 이 수는 계속 증가하고 있습니다.
> Amazon Web Services(AWS), Azure, Google Cloud Platform(GCP), Kubernetes, Helm, GitHub, Splunk, DataDog 등을 포함하여 <b>[Terraform Registry](https://registry.terraform.io/)</b>에서 공개적으로 사용 가능한 모든 공급자를 찾을 수 있습니다.

> 핵심 Terraform 워크플로는 세 단계로 구성됩니다.

> - <b>write</b>: 여러 클라우드 공급자 및 서비스에 걸쳐 있을 수 있는 리소스를 정의합니다. 예를 들어 보안 그룹 및 로드 밸런서가 있는 Virtual Private Cloud(VPC) 네트워크의 가상 머신에 애플리케이션을 배포하기 위한 구성을 생성할 수 있습니다.
> - <b>plan</b>: Terraform은 기존 인프라 및 구성을 기반으로 생성, 업데이트 또는 파괴할 인프라를 설명하는 실행 계획을 생성합니다.
> - <b>apply</b>: 승인 시 Terraform은 리소스 종속성을 고려하여 제안된 작업을 올바른 순서로 수행합니다. 예를 들어 VPC의 속성을 업데이트하고 해당 VPC의 가상 머신 수를 변경하면 Terraform은 가상 머신을 확장하기 전에 VPC를 다시 생성합니다.

<img src="https://content.hashicorp.com/api/assets?product=terraform&version=refs%2Fheads%2Fv1.3&asset=website%2Fimg%2Fdocs%2Fintro-terraform-workflow.png&width=2038&height=1773">

- [Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md)
- [Commands(CLI)](https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md)
- [Backends](https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md)

---

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
