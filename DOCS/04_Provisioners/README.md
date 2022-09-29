### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [04.Provisioners](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Providers/README.md">Providers</a>
    ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md">Provisioners</a></b></i>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md">Modules</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md">Functions</a>
</pre>

---

## 04. Provisioners

> Provisioner를 사용하면 서버 또는 기타 인프라 개체를 서비스 할 수 있도록 로컬 컴퓨터 또는 원격 컴퓨터에서 특정 작업을 모델링 할 수 있습니다.

#### Provisioners are a Last Resort

> Terraform에는 Terraform의 선언적 모델에서 직접 표현할 수 없는 특정 행동이 항상 있을것 임을 알고 프로비저닝의 개념을 실용주의의 척도로 포함합니다.  
> 하지만 이것은 Terraform 사용에 상당한 복잡성과 불확실성을 추가합니다.  
> 최대한 Terraform에서 제공되는 기본 기능으로 시도하고, 다른 옵션이 없을 경우에만 Provisioner를 사용하는 것이 좋습니다.

- [Provisioner Connection Settings](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/01_Provisioner_Connection_Settings/README.md)
- [Provisioner without a Resource](https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/02_Provisioner_without_a_Resource/README.md)

What Providers Do

각 공급자는 Terraform이 관리할 수 있는 리소스 유형 및/또는 데이터 소스 세트를 추가합니다.

모든 리소스 유형은 공급자에 의해 구현됩니다. 공급자가 없으면 Terraform은 어떤 종류의 인프라도 관리할 수 없습니다.

대부분의 공급자는 특정 인프라 플랫폼(클라우드 또는 자체 호스팅)을 구성합니다. 공급자는 고유한 리소스 이름에 대한 난수 생성과 같은 작업을 위한 로컬 유틸리티를 제공할 수도 있습니다.

Where Providers Come From

제공자는 테라폼 자체와 별도로 배포되며, 각 제공자는 자체 릴리스 캐던스와 버전 번호를 가지고 있다.

테라폼 레지스트리는 공개적으로 사용 가능한 테라폼 제공자의 메인 디렉토리이며 대부분의 주요 인프라 플랫폼을 위한 제공자를 호스팅한다.

---

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
