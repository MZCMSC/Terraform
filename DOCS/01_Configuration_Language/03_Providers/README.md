### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [02.Providers](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Providers/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Resource/README.md">Resource</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Data_Sources/README.md">Data_Sources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Providers/README.md"><i><b>Providers</b></i></a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Local_Values/README.md">Local_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/05_Input_Variables/README.md">Input_Variables</a>
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

### Providers

> Terraform은 물리적 시스템, VM, 네트워크 스위치, 컨테이너 등과 같은 인프라 리소스를 생성, 관리 및 업데이트하는 데 사용됩니다.  
> 거의 모든 인프라 유형의 Terraform 리소스로 표현 될 수 있습니다.
> 자원(Resource)은 Terraform 언어의 기본 구성이지만 자원의 동작은 연관된 자원 유형에 의존하며 이러한 유형은 제공자(Provider)에 의해 정의됩니다.
> 각 제공자는 이름 지정된 자원 유형 세트를 제공하고 각 자원 유형에 대해 허용되는 인수, 내보내는 속성 및 해당 유형의 자원 변경 사항이 실제로 원격 API에 적용되는 방법을 정의합니다.
> 사용 가능한 대부분의 Provider는 하나의 클라우드 또는 On-premise 인프라 플랫폼에 해당하며 해당 플랫폼의 각 기능에 해당하는 리소스 유형을 제공합니다.
> 공급자는 일반적으로 엔드 포인트 URL, 리전, 인증 설정 등을 지정하기 위해 자체 구성이 필요합니다. 동일한 제공자에 속하는 모든 자원 유형은 동일한 구성을 공유하므로 모든 자원 선언에서 이 공통 정보를 반복할 필요가 없습니다.

#### Provider Configuration

> Provider 블록을 사용하여 설정 합니다.

```hcl
provider "aws" {
  region = var.region
}
```

```hcl
provider "google" {
  region  = var.region
  project = var.project
}
```

#### Initialization

> 새 제공자가 명시적으로 제공자 블록을 통해 또는 해당 제공자의 자원을 추가하여 구성에 추가될 때마다 Terraform은 제공자를 사용하기 전에 제공자를 초기화 해야 합니다.  
> 초기화는 나중에 실행할수 있도록 공급자의 플러그인을 다운로드하여 설치합니다.

```
terraform init
```

#### AWS Provider

> AWS (Amazon Web Services) 공급자는 AWS에서 지원하는 많은 리소스와 상호 작용하는데 사용됩니다. 공급자를 사용하려면 적절한 자격 증명으로 공급자를 구성해야 합니다.  
> 아래 그림은 AWS Provider를 선언한 예시 코드입니다.

```hcl
# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
```

##### Authentication

> AWS 공급자는 인증을 위한 신임 정보를 제공하는 유연한 수단을 제공합니다. 다음과 같은 방법이 순서대로 지원되며 아래에 설명되어 있습니다.

- Static credentials
- Environment variables
- Shared credentials file
- EC2 Role

###### Static credentials

> ※ info  
> 모든 Terraform 구성에 대한 자격 증명 하드 코딩은 권장되지 않으며 이 파일이 공개 버전 제어 시스템에 커밋되면 비밀 유출 위험이 있습니다.

```hcl
provider "aws" {
  region     = "ap-northeast-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

###### Environment variable

> Aws Access Key 및 AWS Secret Key를 각각 나타내는 AWS_ACCESS_KEY\_\_ID 및 AWS_SECRET_ACCESS_KEY 환경 변수를 통해 자격 증명을 제공할 수 있습니다.

```hcl
provider "aws" {}
```

```hcl
export AWS_ACCESS_KEY_ID="my-access-key"
export AWS_SECRET_ACCESS_KEY="my-secret-key"
export AWS_DEFAULT_REGION="ap-northeast-2"
terraform plan
```

###### Shared credentials file

> AWS 자격 증명 파일을 사용하여 자격 명을 지정할 수 있습니다. 기본 위치는 Linux 및 OS X에서 $HOME/.aws/credentials 이거나 Windows 사용자의 경우 %USERPROFILE%\.aws\credentials 입니다.

```hcl
provider "aws" {
  region                  = "ap-northeast-1"
  shared_credentials_file = "/Users/tf_user/.aws/cred-custom"
  profile                 = "custom-profile"
}
```

###### EC2 Role

> IAM 역할을 사용하여 IAM 인스턴스 프로파일이 있는 EC2 인스턴스에서 Terraform을 실행중인 경우 Terraform은 메타 데이터 API 엔드 ㅗ인트에 자격 증명을 요청하여 권한을 획득할 수 있습니다.

###### Assume role

> 역할 ARN이 제공되면 Terraform은 제공된 자격 증명을 사용하여 이 역할을 맡습니다.

```hcl
provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
    session_name = "SESSION_NAME"
    external_id  = "EXTERNAL_ID"
  }
}
```
---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Input_Variables/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Resources/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
