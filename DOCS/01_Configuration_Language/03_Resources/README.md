### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [03.Resources](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Resources/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Files_and_Directories/README.md">Files_and_Directories</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Syntax/README.md">Syntax</a>
    │                        ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Resources/README.md">Resources</a></b></i>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Data_Sources/README.md">Data_Sources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/05_Providers/README.md">Providers</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Input_Variables/README.md">Input_Variables</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Output_Values/README.md">Output_Values</a>
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

### Resources

> Terraform 언어에서 리소스는 가장 중요한 요소입니다. 각 리소스 블록은 가상 네트워크, 컴퓨팅 인스턴스 또는 DNS 레코드와 같은 상위 구성 요소와 같은 하나 이상의 인프라 개체를 설명합니다.

#### Resource Block

> 리소스 선언 구문을 문서화합니다.

#### Resource Syntax

> 리소스 선언에는 여러 고급 기능이 포함될 수 있지만 초기 사용에는 작은 하위 집합만 필요합니다.

```hcl
resource "aws_instance" "web" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
}
```

> 해당 리소스 블록은 "aws_instance"라는 리소스 타입을 사용하여 "web"의 로컬 이름으로 리소스 생성을 선언합니다.
> ami와 instance_type은 aws_instance 리소스 타입의 인수(argument)입니다.

#### Resource Argument

> 리소스 블록 본문에 있는 대부분의 인수는 선택한 리소스 유형에 따라 다릅니다. 리소스 유형의 설명서에는 사용 가능한 인수와 해당 값의 형식 지정 방법이 나열되어 있습니다.
> 모든 Terraform 공급자는 리소스 유형과 인수를 설명하는 Terraform Registry 에 배포됩니다.

#### Resource Behavior

> 새 구성을 처음 작성하는 경우 구성에서 정의하는 리소스는 구성에만 존재하며 대상 플랫폼의 실제 인프라 개체를 아직 나타내지 않습니다.
> 이런 리소스 구성을 적용(apply 명령어를 통해 생성)하면 state에 저장되어 관리됩니다.
> Terraform 구성을 적용하는 것은 리소스 구성과 일치하도록 실제 인프라 개체를 생성, 업데이트 및 삭제하는 프로세스입니다.

> 요약하면 Terraform 구성을 적용(apply)하면 다음이 수행됩니다.

> 생성한 구성파일에 존재하지만 state에 없는 리소스는 생성합니다.
> state에는 있지만 구성파일에는 없는 리소스는 삭제합니다.
> 인수가 변경된 리소스는 업데이트합니다.
> 인수가 변경되었지만 API 제한으로 인해 업데이트가 불가능할 경우 리소스를 삭제하고 다시 생성합니다.

#### Meta-Arguments

> Terraform 언어는 리소스의 동작을 변경하기 위해 모든 리소스 유형과 함께 사용할 수 있는 여러 메타 인수를 정의합니다.

- depend_on: 숨겨진 종속성을 지정
- count: 개수에 따라 여러 리소스 인스턴스 생성
- for_each: 맵 또는 문자열 세트에 따라 여러 인스턴스를 생성
- provider: 기본이 아닌 공급자 구성을 선택하는 경우
- lifecycle: 수명 주기 사용자 정의
- provisioner: 리소스 생성 후 추가 작업을 수행


#### depends_on

> Terraform이 자동으로 유추할 수 없는 숨겨진 리소스 또는 모듈 종속성을 처리하려면 "depends_on" 메타 인수를 사용하십시오.
> 자원 유형에 관계없이 블록 및 모든 블록 depends_on에서 메타 인수를 사용할 수 있습니다 

> 아래 예시코드를 보면 EC2 instance를 생성하기 전에 instance_profile을 생성해야 하는 것을 확인 할 수 있으며, 

```hcl

resource "aws_iam_instance_profile" "example" {
  role = aws_iam_role.example.name
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile = aws_iam_instance_profile.example

  depends_on = [
    aws_iam_role_policy.example,
  ]
}
```

#### count

> count 메타 인수는 정수 값을 허용하고 리소스 또는 모듈의 여러 인스턴스를 만듭니다.

```hcl
resource "aws_instance" "server" {
  count = 4
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "Server ${count.index}"
  }
}
```


#### for_each

> for_each 메타 인수는 맵 또는 문자열 집합을 허용하고 해당 맵 또는 집합의 각 항목에 대한 인스턴스를 만듭니다.

Map:

```hcl
resource "azurerm_resource_group" "rg" {
  for_each = {
    a_group = "eastus"
    another_group = "westus2"
  }
  name     = each.key
  location = each.value
}
```

Set of strings:

```hcl
resource "aws_iam_user" "the-accounts" {
  for_each = toset( ["Todd", "James", "Alice", "Dottie"] )
  name     = each.key
}
```

Child module:

```hcl
# my_buckets.tf
module "bucket" {
  for_each = toset(["assets", "media"])
  source   = "./publish_bucket"
  name     = "${each.key}_bucket"
}
```

```hcl
# publish_bucket/bucket-and-cloudfront.tf
variable "name" {} # this is the input parameter of the module

resource "aws_s3_bucket" "example" {
  # Because var.name includes each.key in the calling
  # module block, its value will be different for
  # each instance of this module.
  bucket = var.name

  # ...
}

resource "aws_iam_user" "deploy_user" {
  # ...
}
```

#### provider

> provider 메타 인수를 사용하여 리소스에 대한 대체 공급자 구성을 선택할 수 있습니다.

```hcl
# default configuration
provider "google" {
  region = "us-central1"
}

# alternate configuration, whose alias is "europe"
provider "google" {
  alias  = "europe"
  region = "europe-west1"
}

resource "google_compute_instance" "example" {
  # This "provider" meta-argument selects the google provider
  # configuration whose alias is "europe", rather than the
  # default configuration.
  provider = google.europe

  # ...
}
```


#### lifecycle

> 리소스의 생명주기를 정의합니다.

```hcl
resource "aws_launch_configuration" "worker" {
  // ...

  lifecycle {
    create_before_destroy = true
  }
}
```

> create_before_destroy(bool) - 현재 업데이트 할 수 없는 리소스 인수를 변경해야하는 경우 Terraform은 기존 객체를 삭제한 다음 새로 구성된 인수로 새 대체 객체를 만듭니다.  
> prevent_destroy(bool) - 인수가 구성에 존재하는 한 자원과 관련된 인프라 개체를 파괴하는 계획을 Terraform이 오류와 함께 거부하게 합니다.  
> Ignore_changes(list of attribute names) - Terraform은 실제 인프라 개체의 현재 설정에서 차이를 감지하고 구성과 일치하도록 원격 개체를 업데이트를 시도 합니다. 하지만 외부에서 변경된 리소스를 변경 하고 싶지 않을때 사용될 수 있습니다.


#### provisioners

> Provisioner를 사용하면 서버 또는 기타 인프라 개체를 서비스 할 수 있도록 로컬 컴퓨터 또는 원격 컴퓨터에서 특정 작업을 모델링 할 수 있습니다.

##### Provisioners are a Last Resort

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

##### Provisioner Connection Settings

> 대부분의 프로 비져는 SSH 또는 WinRM을 통해 원격 리소스에 액세스 해야하며 연결 방법에 대한 세부 정보가 포함된 중첩된 연결 블록이 필요합니다.

###### Example

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

##### Provisioner without a Resource

> 특정 리소스와 직접 연결되지 않은 프로 비저를 실행해야 하는 경우 해당 공급자를 null_resource와 연결할 수 있습니다.

###### Example

```hcl
resource "aws_instance" "cluster"{
  count = 3

  # ...
}

resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
triggers = {
    cluster_instance_ids = "${join(",", aws_instance.cluster.*.id)}"}

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
connection {
    host = "${element(aws_instance.cluster.*.public_ip, 0)}"
  }

provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
      "bootstrap-cluster.sh ${join(" ", aws_instance.cluster.*.private_ip)}",
    ]
  }
}
```

###### Example - kubernetes provider 사용 전

```hcl
resource "null_resource" "executor" {
  depends_on = [aws_eks_cluster.cluster]

triggers = {
    endpoint = aws_eks_cluster.cluster.endpoint
}

provisioner "local-exec" {
    working_dir = path.module

    command =<< EOS
echo "kubectl apply -f aws-auth.yaml"
EOS

    interpreter =var.local_exec_interpreter
  }
}
```

###### Example - kubernetes provider 사용 후

```hcl
resource "kubernetes_config_map" "aws_auth" {
  depends_on = [aws_eks_cluster.cluster]

metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode(var.map_roles)
    mapUsers = yamlencode(var.map_users)
  }
}
```

#### Resource Dependencies

> 구성의 대부분의 리소스 간에는 특별한 관계가 없으며 Terraform은 관련이 없는 여러 리소스를 동시에 변경할 수 있습니다.
> 그러나 일부 자원은 다른 특정 자원 이후에 처리해야 합니다. 때로는 리소스 작동 방식 때문일 수도 있고 리소스 구성에 다른 리소스에서 생성 된 정보만 필요하기도 합니다.
> 대부분의 리소스 종속성은 자동으로 처리됩니다. Terraform은 리소스 블록 내의 표현식을 분석하여 다른 객체에 대한 참조를 찾 다음 해당 참조를 리소스를 생성, 업데이트 또는 파괴 할때 암> 시적 순서 요구 사항으로 취급 합니다. 다른 자원에 대한 행동 종속성이 있는 대부분의 자원도 해당 자원의 데이터를 참조하므로 일반적으로 자원간 종속성을 수동으로 지정할 필요는 없습니다.

> 그러나 일부 종속성은 구성에서 암시적으로 인식될 수 없습니다. 예를 들어 Terraform이 액세스 제어 정책을 관리하고 해당 정책이 있어야 하는 조치를 취해야 하는 경우 액세스 정책과 해당 > 정책이 종속된 리소스간에 숨겨진 종속성이 있습니다. 이러한 드문 경우에 depend_on 메타 인수는 명시적으로 종속성을 지정할 수 있습니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Syntax/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Data_Sources/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
