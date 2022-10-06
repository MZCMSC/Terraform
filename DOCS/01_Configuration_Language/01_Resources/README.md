### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [03.Resources](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Resources/README.md)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Resources/README.md"><i><b>Resources</b></i></a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Data_Sources/README.md">Data_Sources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Providers/README.md">Providers</a>
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

### Resources

> Terraform 언어에서 리소스는 가장 중요한 요소입니다. 각 리소스 블록은 가상 네트워크, 컴퓨팅 인스턴스 또는 DNS 레코드와 같은 상위 구성 요소와 같은 하나 이상의 인프라 개체를 설명합니다.
> Terraform 언어에서 리소스는 가장 중요한 요소입니다. 각 리소스 블록은 가상 네트워크, 컴퓨팅 인스턴스 또는 DNS 레코드와 같은 상위 구성 요소와 같은 하나 이상의 인프라 개체를 설명합니다.

#### Resource Syntax

> 아래는 aws ec2 instance를 잘 생성하는 가장 심플한 코드 입니다.

```hcl
resource "aws_instance" "sample" {
  ami           = var.ami_id
  instance_type = var.instance_type
  }
```

> Resource 블록을 사용하여 설정 합니다. Aws_instance의 자원을 생성하며, sample의 이름을 가집니다.
> 블록 내의 ami instance_type은 aws_instance 자원 유형의 인수 입니다.

#### Resource Behavior

> 리소스 블록은 특정 인프라의 선언적 정의 입니다. 정의한 자원은 실제 인프라 개체를 타내지는 않습니다.
> Terraform apply를 통하여 설정과 구성이 일치 하도록 실제 인프라 개체를 생성, 업데이트 및 삭제를 수행 합니다.
> 새 인프라 개체를 생성하면 State에 저장어 관리 됩니다.

#### Resource Dependencies

> 구성의 대부분의 리소스 간에는 특별한 관계가 없으며 Terraform은 관련이 없는 여러 리소스를 동시에 변경할 수 있습니다.
> 그러나 일부 자원은 다른 특정 자원 이후에 처리해야 합니다. 때로는 리소스 작동 방식 때문일 수도 있고 리소스 구성에 다른 리소스에서 생성 된 정보만 필요하기도 합니다.
> 대부분의 리소스 종속성은 자동으로 처리됩니다. Terraform은 리소스 블록 내의 표현식을 분석하여 다른 객체에 대한 참조를 찾 다음 해당 참조를 리소스를 생성, 업데이트 또는 파괴 할때 암> 시적 순서 요구 사항으로 취급 합니다. 다른 자원에 대한 행동 종속성이 있는 대부분의 자원도 해당 자원의 데이터를 참조하므로 일반적으로 자원간 종속성을 수동으로 지정할 필요는 없습니다.

> 그러나 일부 종속성은 구성에서 암시적으로 인식될 수 없습니다. 예를 들어 Terraform이 액세스 제어 정책을 관리하고 해당 정책이 있어야 하는 조치를 취해야 하는 경우 액세스 정책과 해당 > 정책이 종속된 리소스간에 숨겨진 종속성이 있습니다. 이러한 드문 경우에 depend_on 메타 인수는 명시적으로 종속성을 지정할 수 있습니다.

#### Meta-Arguments

> Terraform CLI는 다음과 같은 메타 인수를 정의합니다. 이 인수는 모든 자원 유형과 함께 사용하여 자원의 동작을 변경할 수 있습니다.

- count: 개수에 따라 여러 자원을 작성
- depend_on: 숨겨진 종속성을 명시적으로 지정
- for_each: 맵 또는 문자열 세트에 따라 여러 자원을 작성
- provider: 기본이 아닌 공급자 구성을 선택
- lifecycle: 라이프 사이클 사용자 정의
- provisioner and connection: 리소스 생성 후 추가 작업을 수행

#### count

> 4개의 EC2 instance를 생성 합니다.

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

```hcl
resource "aws_vpc" "this" {
  count = var.create_vpc ? 1 : 0

  cidr_block = var.vpc_cidr
}
```

#### depends_on

> EC2 instance를 생성하기 전, instance_profile을 생성해야 한다는것은 aws_insatance 안에 정의되어 있으므로 유추가 가능합니다.  
> 하지만, aws_iam_role_policy는 Terraform이 유추해 낼 수 없으므로 선언해 주어야 합니다.

```hcl
resource "aws_iam_role" "example" {
  name               = var.name
  assume_role_policy = "..."
}

resource "aws_iam_instance_profile" "example" {
  role = aws_iam_role.example.name
}

resource "aws_iam_role_policy" "example" {
  name   = var.name
  role   = aws_iam_role.example.name
  policy = "..."
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

#### for_each

> Autoscaling Group에서 mixed_instances로 정의할 수 있는데 var.mixed_instances 배열로 n개의 값을 전달 할 수 있습니다.

```hcl
resource "aws_autoscaling_group" "worker" {
  name = var.name

  min_size = var.min
  max_size = var.max

  vpc_zone_identifier = var.subnet_ids

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.worker.id
        version            = "$Latest"
      }

      override {
        instance_type = var.instance_type
      }

      dynamic "override" {
        for_each = var.mixed_instances
        content {
          instance_type = override.value
        }
      }
    }
  }
}
```

```hcl
      override {
        instance_type = var.instance_type
      }

      override {
        instance_type = var.mixed_instances.0
      }

      override {
        instance_type = var.mixed_instances.1
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


#### Provisioners

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


---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Providers/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Output_Values/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
