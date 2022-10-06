### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [00.Terraform](https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md"><i><b>Terraform</b></i></a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
</pre>

---

# Terraform 이란?

> HashiCorp Terraform은 버전을 지정하고 재사용하고 공유할 수 있는 사람이 읽을 수 있는 구성 파일에서 클라우드 및 온프레미스 리소스를 모두 정의할 수 있는 코드형 인프라 도구입니다.
> 그런 다음 일관된 워크플로를 사용하여 수명 주기 동안 모든 인프라를 프로비저닝하고 관리할 수 있습니다.
> Terraform은 컴퓨팅, 스토리지 및 네트워킹 리소스와 같은 하위 수준 구성 요소와 DNS 항목 및 SaaS 기능과 같은 상위 수준 구성 요소를 관리할 수 있습니다.

## Terraform은 어떻게 작동합니까?

> Terraform은 API(응용 프로그래밍 인터페이스)를 통해 클라우드 플랫폼 및 기타 서비스에서 리소스를 생성하고 관리합니다.
> 제공업체를 통해 Terraform은 액세스 가능한 API를 통해 거의 모든 플랫폼 또는 서비스와 함께 작동할 수 있습니다.

> HashiCorp와 Terraform 커뮤니티는 이미 수천 가지 유형의 리소스와 서비스를 관리하기 위해 1700개 이상의 공급자를 작성했으며, 이 수는 계속 증가하고 있습니다.
> Amazon Web Services(AWS), Azure, Google Cloud Platform(GCP), Kubernetes, Helm, GitHub, Splunk, DataDog 등을 포함하여 Terraform Registry에서 공개적으로 사용 가능한 모든 공급자를 찾을 수 있습니다.

> 핵심 Terraform 워크플로는 세 단계로 구성됩니다.

> - write: 여러 클라우드 공급자 및 서비스에 걸쳐 있을 수 있는 리소스를 정의합니다. 예를 들어 보안 그룹 및 로드 밸런서가 있는 Virtual Private Cloud(VPC) 네트워크의 가상 머신에 애플리케이션을 배포하기 위한 구성을 생성할 수 있습니다.
> - plan: Terraform은 기존 인프라 및 구성을 기반으로 생성, 업데이트 또는 파괴할 인프라를 설명하는 실행 계획을 생성합니다.
> - apply: 승인 시 Terraform은 리소스 종속성을 고려하여 제안된 작업을 올바른 순서로 수행합니다. 예를 들어 VPC의 속성을 업데이트하고 해당 VPC의 가상 머신 수를 변경하면 Terraform은 가상 머신을 확장하기 전에 VPC를 다시 생성합니다.


- [Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md)
- [Commands(CLI)](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md>)
- [Providers](https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Providers/README.md)
- [Provisioners](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md)
- [Modules](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md)
- [State](https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/README.md)
- [Backends](https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md)
- [Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md)

---

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
