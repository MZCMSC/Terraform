# Code guide 
## main.tf 파일 하나로 code 되어 있음.

-----
### 파일 구성
```
.
└── main.tf
```



> **향후 생성 추가 되는 파일**
> - terraform init 명령어 적용시 생성 파일
> ```
> ├── .terraform
> │   ├── modules
> │   └── providers
> │  
> └── .terraform.lock.hcl
> ```
>
> - terraform apply 명령어 적용시
> ```
> ├── terraform.tfstate
> └── terraform.tfstate.backup      
> ```

-----
### 테라폼 명령어 
```
실행
$ terraform init 

계획
$ terraform plan

적용
$ terraform apply
```

-----
### 사용된 리소스 블럭
```
1. terraform    block
2. provider     block
3. resource     block
```

> 참고용 URL
> - https://www.terraform.io/intro
> - https://www.terraform.io/language
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs

-----
## main.tf 
### terraform 블럭
```hcl
terraform {
  required_version = ">= 1.2.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}
```
- required_version
    - 실행 위치 디바이스의 테라폼 버전 관련 설정

- required_providers
    - registry.terraform.io/hashicorp/aws 에서 4.22.0 버전 사용

`main.tf 파일은 향후 module 블럭 설정 파일로 사용 가능 `
-----
### provider 블럭
```hcl
providre "aws" {
    region = "ap-northeat-2"
}
```
- provider 는 "aws"로 사용, 리전은 "ap-northeast-2" Seoul 리전으로 사용을 선언

-----
### resource 블럭
- resource 블럭은 실제 AWS에 존재하는 서비스를 생성/삭제 등과 같은 액션을 가능하도록 하는 블럭

#### resource 블럭의 구조
```hcl
resource "aws_vpc" "this" {
  cidr_block = "10.50.0.0/16"
}

<BLOCK TYPE> "<BLOCK LABEL_1>" "<BLOCK LABEL_2>" {
    <IDENTIFIER> = <EXPRESSION>
}
```
> 참고용 URL 
> - https://www.terraform.io/language

-----
#### resource vpc 블럭
```hcl
resource "aws_vpc" "this" {
  cidr_block = "10.50.0.0/16"
  tags       = { "Name" = "test-tf-vpc" }
}
```
- 블럭 타입은 "resource", 블럭 라벨 1은 "aws_vpc" , 블럭 라벨 2는 "this"
    - 블럭 라벨 2는 Code 작성자가 임의로 설정 가능하다.

- 식별자는 2개, 표현값도 2개 설정되어 있다. 
    - 식별자 
        - cidr_block
        - tags
    - 표현값
        - "10.50.0.0/16"
        - { "Name" = "test-tf-vpc" }

> 참고용 URL 
> - https://www.terraform.io/language/resources/syntax
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

-----
#### resource subnet 블럭
```hcl
resource "aws_subnet" "main_pub_a_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.50.10.0/24"
  availability_zone = "ap-northeast-2a"
  tags              = { Name = "test-tf-ap-northeast-2a-public-main-subnet" }
}

...(생략) (필요한 갯수 만큼 설정)
```
- 블럭 타입은 "resource", 블럭 라벨 1은 "aws_subnet" , 블럭 라벨 2는 "main_pub_a_subnet"

- 식별자는 4개, 표현값도 4개로 구성되어 있다.
    - 식별자 
        - vpc_id
        - cidr_block
        - availability_zone
        - tags
    - 표현값
        - aws_vpc_.this.id
            - 바로 위에 설정한 "resouce" "aws_vpc" "this" 의 코드 블럭(생성된 정보값)의 id 값을 참조하도록 설정
        - "10.50.10.0/24"
        - "ap-northeast-2a"
        - { Name = "test-tf-ap-northeast-2a-public-main-subnet" }

> 참고용 URL 
> - https://www.terraform.io/language/resources/syntax
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

-----
#### resource igw(internet gateway) 블럭
```hcl
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-igw" }
}
```
- 블럭 타입은 "resource", 블럭 라벨 1은 "aws_internet_gateway" , 블럭 라벨 2는 "this"
- 식별자 및 표현값은 각각 2개
    - 식별자 
        - vpc_id
        - tags
    - 표현값
        - aws_vpc.this.id
        - { Name = "test-tf-vpc-igw" }

> **위의 예제와 같이 설정된 "aws_vpc" "this"를 vpc_id 식별자에 표현값으로 참조 하거나, tags 처럼 사용자가 직접 설정 하여 Code를 작성한다.**

> 참고용 URL 
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

-----
#### resource natgw(nat gateway) 블럭
```hcl
# EIP 생성
resource "aws_eip" "natgw_a_eip" {
  vpc = true
  lifecycle { create_before_destroy = true }
  tags = { Name = "test-tf-vpc-ap-northeast-2a-nat-eip" }
}

# NAT G/W 생성
resource "aws_nat_gateway" "natgw_a" {
  allocation_id     = aws_eip.natgw_a_eip.id
  subnet_id         = aws_subnet.main_pub_a_subnet.id
  connectivity_type = "public"
  depends_on        = [aws_eip.natgw_a_eip]
  tags              = { Name = "test-tf-vpc-ap-northeast-2a-main-natgw" }
}
...(생략) (필요한 갯수 만큼 설정)
```
> **NAT Gateway 의 경우 Public 으로 생성 진행 Public으로 생성시 EIP가 필요하여 EIP 설정후 대상 NAT Gateway에 Attach**

+ **resource "aws_eip" "natgw_a_eip" {...} 블럭 생성 진행**
  - 해당 블럭의 내용중 lifecycle은 resource 블럭의 Meta-Arguments 값이다. 
    - 기존에 EIP가 존재하다고 가정하면, 기존 EIP를 유지한 상태에서 신규로 생성 및 연결후 기존 EIP를 제거 설정 구문

+ **resource "aws_nat_gateway" "natgw_a" {...} 블럭 생성 진행**
  - allocation_id
    - 생성된 EIP 연결 설정
  - subnet_id
    - 위에서 생성한 Subnet 연결 설정
  - connectivity_type
    - NAT G/W의 통신 방식 설정
  - depends_on
    - 명시적으로 [aws_eip.natgw_a_eip] 생성이 정상적으로 이뤄진 후, 해당 리소스가 생성 되로록 설정

> 참고용 URL 
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

-----
#### resource route_table 블럭
##### default route_table 로 알아보는 전체 식별자 Sample
- 적절하게 필요한 정보를 설정하여 사용
```hcl
resource "aws_default_route_table" "this" {
  default_route_table_id = aws_vpc.this.default_route_table_id
  # route = [ {
  #   cidr_block = "10.50.1.0/24"
  #   core_network_arn = "value"
  #   destination_prefix_list_id = "value"
  #   egress_only_gateway_id = "value"
  #   gateway_id = "value"
  #   instance_id = "value"
  #   ipv6_cidr_block = "value"
  #   nat_gateway_id = "value"
  #   network_interface_id = "value"
  #   transit_gateway_id = "value"
  #   vpc_endpoint_id = "value"
  #   vpc_peering_connection_id = "value"
  # } ]
  tags = { Name = "test-tf-vpc-default-rtb" }
```

-----
##### 실제 설정 진행하는 route_table
```hcl
# RTB 생성
resource "aws_route_table" "pub_a_main_rtb" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-ap-northeast-2a-public-main-rtb" }
}

# RTB to Subnet association 
resource "aws_route_table_association" "pub_a_main_rtb" {
  route_table_id = aws_route_table.pub_a_main_rtb.id
  subnet_id      = aws_subnet.main_pub_a_subnet.id
  # gateway_id = aws_internet_gateway.this.id
}
...(생략) (필요한 갯수 만큼 설정)
```
+ **resource "aws_route_table" "pub_a_main_rtb" {...} 블럭 생성 진행**
  - vpc_id
    - 위에서 생성한 VPC 정보값 참조 설정

+ **resource "aws_route_table_association" "pub_a_main_rtb" {...} 블럭 생성 진행**
  - route_table_id
    - 생성된 RTB 의 id 참조하여 설정
  - subnet_id
    - 생성된 서브넷 의 id 참조하여 설정
  - gateway_id
    - IGW 및 NAT 연결 가능한 식별자 설정을 보여주고자 작성
    - 해당 항목은 subnet_id 와 중복하여 설정 불가.

> 참고용 URL 
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

-----
#### Security_group 블럭
```hcl
resource "aws_security_group" "bastion_sg" {
  description = "Bastion Server Security group"
  name        = "Bastion-SG"
  vpc_id      = aws_vpc.this.id

  # ingress{
  #     description = "SSH Inbound Port"
  #     protocol = "tcp"
  #     from_port = 22
  #     to_port = 22
  #     cidr_blocks = ["0.0.0.0/0"]
  # }
  egress {
    description = "SSH Outbound Port"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "test-tf-bastion-sg" }
}
...(생략) (필요한 서브넷의 갯수 만큼 설정)
```
+ **resource "aws_security_group" "bastion_sg" {...} 블럭 생성 진행**
  - description
    - 생성하고자 하는 SG의 설명문 항목
  - name
    - 생성하고자 하는 SG의 이름 항목
  - vpc_id
    - 생성하고자 하는 SG의 생성 영역 VPC기준
    - SG의 경우 각각 VPC에 종속 되는 리소스

- SG 블럭에서의 내부 블럭을 2개 작성, 1개 적용으로 작성 하였다. 
  - 내부 블럭에서 ingress , egress 는 SG의 inbound , outbound 와 동일하다.
    - ingress -> inbound
    - egress -> outbound

- ingress (주석 되어 있음)
  - description
    - 해당 SG의 inbound rule 의 설명문
  - protocol
    - "tcp"
  - from_port
    - 포트 설정 : 어디서부터 (시작점)
  - to_port
    - 포트 설정 : 어디까지 (종료점)
  - cidr_blocks
    - **[ ]** 리스트 형식으로 입력
    - "0.0.0.0/0" 전체 IP 영역
  
- egress
  - protocol
    - "-1"
      - 전체 프로토콜에 대해서 가능하게 설정
      - "-1" 은 전체 프로토콜 범위를 뜻함
  - (해당 rule을 설정시 Outbound는 전체 허용)

> 참고용 URL 
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

-----
#### Security_group_rule 블럭
```hcl
resource "aws_security_group_rule" "bastion_ssh_ingress_rule" {
  description       = "SSH - Bastion Server inbound rule"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion_sg.id

  # SSH 통신 허용 IP 입력
  cidr_blocks = ["0.0.0.0/0", "211.60.50.190/32"]
  /* 
  211.60.50.190 = Megazone Office IP
 */
}
...(생략) (필요한 서브넷의 갯수 만큼 설정)
```
+ **resource "aws_security_group_rule" "bastion_ssh_ingress_rule" {...} 블럭 생성 진행**
  - description
    - 해당 SG의 inbound rule 의 설명문
  - type
    - ingress 
       - 내용을 기반으로 설명시 **resource "aws_security_group" "bastion_sg" {...}** 블럭의   inbound rule을 설정
    - 타입에는 2가지 존재 
      - 1. ingress
      - 2. egress
  - from_port
    - 포트 설정 : 어디서부터 (시작점)
  - to_port
    - 포트 설정 : 어디까지 (종료점)
  - security_group_id
    - 해당 블럭을 내용을 어떤 SG에 설정할지 대상을 설정
  - cidr_blocks
    - **[ ]** 리스트 형식으로 입력
    - "0.0.0.0/0" 전체 IP 영역 및 특정 IP
      - Sample로 작성하였기에 Megazoen UTM 장비의 공인 IP도 작성

> 참고용 URL  
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule

-----
#### EC2(Instance) 블럭
```hcl
resource "aws_instance" "bastion" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2a"
  instance_type     = "t2.micro"
# security_groups   = ["${aws_security_group.bastion_sg.id}", ]
  security_groups   = [aws_security_group.bastion_sg.id, ]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.main_pub_a_subnet.id

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2a-bastion" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2a-bastion" }
}

resource "aws_eip" "bastion_eip" {
  vpc      = true
  instance = aws_instance.bastion.id
  tags     = { Name = "test-tf-vpc-ap-northeast-2a-bastion-eip" }
}
...(생략) (필요한 서브넷의 갯수 만큼 설정)
```
+ **resource "aws_instance" "bastion" {...} 블럭 생성 진행**
  - ami
    - EC2 instance 생성시 필요한 AMI 이미지
  - availability_zone
    - EC2 instance 생성시 위치 하는 AZ
  - instance_type
    - EC2 instance 생성시 type
  - security_groups
    - EC2 instance 생성시 Attach 진행 하는 SG
    - 표현값의 경우 "${aws_security_group.bastion_sg.id}" or aws_security_group.bastion_sg.id 사용가능
  - key_name
    - EC2 instance 생성시 적용 *.pem key (key_pair)
    - __**`빠른 진행을 위해서 기존 AWS key_pair 사용`**__
  - subnet_id
    - EC2 instance 가 생성 되는 subnet 위치
  
  - root_block_device {...} 내부 블럭
    - EC2 instance 생성시 기본 EBS(root_block)
    - "gp3" 타입의 "8" Gib 로 생성
  - delete_on_termination (주석)
    - 해당 설정문은 AWS의 __**"termination protection"**__ 설정 옵션

+ **resource "aws_eip" "bastion_eip" {...} 블럭 생성 진행**
  - instance
    - 생성된 EIP 리소스를 설정된 EC2 instance 에 Associate 진행


> 참고용 URL  
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
     
     
     
     
     
> 참고용 URL (AWS)
> - https://aws.amazon.com/ko/amazon-linux-ami/
> - https://aws.amazon.com/ko/ec2/instance-types/

-----
### **ELB(Elastic Load Balancing)**
#### ALB(Application Load Balancers) 블럭
```hcl
resource "aws_lb" "front_alb" {
  name               = "test-tf-ext-front-alb"
  internal           = false # Public
  load_balancer_type = "application"
  subnets = [
    aws_subnet.main_pub_a_subnet.id,
    aws_subnet.main_pub_c_subnet.id
  ]
  security_groups = [
    aws_security_group.front_alb_sg.id, 
  ]
  tags = {Name = "test-tf-ext-front-alb"}
}
...(생략) (필요한 서브넷의 갯수 만큼 설정)
```
+ **resource "aws_lb" "front_alb" {...} 블럭 생성 진행**
  - name
    - ALB의 Name 설정
  - internal
    - 해당 식별자의 type는 bool 이다. 
    - false 설정시 Public
      - AWS console의 Scheme : internet-facing 동일
    - true 설정시 Private
      - AWS console의 Scheme : internal 동일
  - load_balancer_type
    - application 타입으로 설정 
      - 추가적으로 해당 식별자의 표현값은 3개 존재 
        - application (ALB)
        - natwork (NLB)
        - gateway (GLB)
  - subnets
    - 해당 ALB에 associate 진행 하고자 하는 subnet 설정
    - 위의 코드는 AZ(subnet) 2곳 설정 
      - A_zone(ap-northeast-2a) , C_zone(ap-northeast-2c)
  - security_groups
    - 해당 ALB에서 사용 하고자 하는 SG 설정

> 참고용 URL  
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

-----
#### ALB Target_group 블럭
```hcl
resource "aws_lb_target_group" "front_alb_tg" {
  name        = "test-tf-front-alb-tg"
  vpc_id      = aws_vpc.this.id
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
}

resource "aws_lb_target_group_attachment" "front_alb_tg_a_attch" {
  target_group_arn = aws_lb_target_group.front_alb_tg.arn
  port             = 80
  target_id        = aws_instance.web_a.id
}
```
+ **resource "aws_lb_target_group" "front_alb_tg" {...} 블럭 생성 진행**
  - name
    - TG의 Name 설정
  - vpc_id
    - 위에서 생성한 VPC의 id값을 참조
    - [resource] aws_vpc.this 의 id 값(속성) 참조
  - target_type
    - TG의 타입을 instance 로 설정
  - port
    - 통신 하고자 하는 port 설정
  - protocol
    - 통신 하고자 하는 port 와 함께 프로토콜 설정
      - 통상 80:HTTP , 443:HTTPS 사용

+ **resource "aws_lb_target_group_attachment" "front_alb_tg_a_attach" {...} 블럭 생성 진행**
  - target_group_arn
    - 위에서 생성한 TG 의 arn(Amazon resource name) 값 설정
      - Resource를 생성(설정) 진행시 각 resource 의 attributes 값의 ID or arn 을 선택적으로 사용해야 한다.
  - port
    - 통신 하고자 하는 port 설정
  - target_id
    - 통신 하고자 하는 대상 설정 (EC2 instance)
      + **resource "aws_lb_target_group" "front_alb_tg" {...} 블럭** 에서 target_type 을 instance 로 설정 참조

> 참고용 URL  
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment

-----
#### ALB listener 블럭
```hcl
resource "aws_lb_listener" "front_alb_listener" {
  load_balancer_arn = aws_lb.front_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_alb_tg.arn
  }
  tags = { Name = "test-tf-vpc-front-alb-listener" }
}
...(생략) (필요한 서브넷의 갯수 만큼 설정)
```
+ **resource "aws_lb_listener" "front_alb_listener" {...} 블럭 생성 진행**
  - load_balancer_arn
    - 위에서 생성된 ALB 리소스의 arn 설정
  - port
    - 통신 하고자 하는 port 설정
  - protocol
    - 통신 하고자 하는 프로토콜 설정 
  - __**default_action 내부 블럭**__
    - type
      - 액션의 타입을 **"forward"**(전달) 설정
        - 타입은 **"forward"**, **"redirect"**, **"fixed-response"**, **"authenticate-cognito"**, **"authenticate-oidc"** 가 있다.

> 참고용 URL  
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_certificate

-----
### **RDS(Relational Database Service)**
#### RDS subnet_group 블럭
```hcl
resource "aws_db_subnet_group" "this" {
  description = "RDS Aurora Database subnet group"
  name        = "test-tf-rds-subnet-group"
  subnet_ids = [
    aws_subnet.rds_pri_a_subnet.id,
    aws_subnet.rds_pri_c_subnet.id
  ]
  tags = { Name = "test-tf-rds-subnet-group" }
}
```
+ **resource "aws_db_subnet_group" "this" {...} 블럭 생성 진행**
  - description
    - 해당 RDS subnet_group의 설명문
  - name
    - subnet_group의 name 설정
  - subnet_ids
    - **[ ]** 리스트 형식으로 입력
    - 생성된 서브넷 의 id 참조하여 설정
    - 위의 코드는 AZ(subnet) 2곳 설정 
      - A_zone(ap-northeast-2a) , C_zone(ap-northeast-2c)

> 참고용 URL
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group

-----
#### RDS parameter_group 블럭
```hcl
resource "aws_rds_cluster_parameter_group" "this" {
  name   = "test-tf-aurora-mysql8-0"
  family = "aurora-mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_parameter_group" "this" {
  name   = "test-tf-aurora-mysql8-0"
  family = "aurora-mysql8.0"
}
```
+ **resource "aws_rds_cluster_parameter_group" "this" {...} 블럭 생성 진행**
  - name
    - 해당 Cluster_parameter_group의 name 설정
  - family
    - 해당 Cluster_parameter_group의 family 설정
     
  - parameter 내부 블럭 (속성 값 변경 예제)
    - name
      - 해당 Cluster_parameter_group의 속성의 nanme 설정
    - value
      - 해당 Cluster_parameter_group의 속성의 value 설정

+ **resource "aws_db_parameter_group" "this" {...} 블럭 생성 진행**
  - name
    - 해당 db_parameter_group의 name 설정
  - family
    - 해당 db_parameter_group의 family 설정

> 참고용 URL  
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group
     
     
     
     

> 참고용 URL (AWS)
> - https://docs.aws.amazon.com/ko_kr/AmazonRDS/latest/AuroraUserGuide/USER_WorkingWithParamGroups.html
> - https://docs.aws.amazon.com/ko_kr/AmazonRDS/latest/UserGuide/USER_WorkingWithParamGroups.html
> - https://docs.aws.amazon.com/cli/latest/reference/rds/describe-db-cluster-parameters.html (확인용)
> - https://docs.aws.amazon.com/cli/latest/reference/rds/describe-db-parameters.html (확인용)

-----
#### RDS cluster(Aurora) 블럭
```hcl
resource "aws_rds_cluster" "this" {
  cluster_identifier               = "test-tf-rds-aurora-cluster"
  db_subnet_group_name             = aws_db_subnet_group.this.id
  
  engine                           = "aurora-mysql"
  engine_version                   = "8.0.mysql_aurora.3.02.0"
  
  availability_zones               = ["ap-northeast-2a", "ap-northeast-2c"]

  database_name                    = "testterraformdb"
  master_username                  = "admin"
  master_password                  = "DBAdmin1004"

  port = 3306

  vpc_security_group_ids           = [aws_security_group.rds_sg.id]

  skip_final_snapshot              = true
  
  db_cluster_parameter_group_name  = aws_rds_cluster_parameter_group.this.id
  db_instance_parameter_group_name = aws_db_parameter_group.this.id
}
```
+ **resource "aws_rds_cluster" "this" {...} 블럭 생성 진행**
  - cluster_identifier
    - 클러스터의 식별자(명칭) 설정
  - db_subnet_group_name
    - 위에서 생성한 subnet_group 설정
  
  - engine
    - 클러스터에서 사용할 엔진 설정
  - engine_version
    - 클러스터에서 사용할 엔진 버전 설정
  
  - availability_zones
    - 클러스터에서 사용할 AZs(가용역역)를 설정
             
  - database_name
    - 데이터베이스의 name 설정
  - master_username
    - 데이터베이스의 사용자(계정) 설정
  - master_password
    - 데이터베이스의 사용자 인증용 암호 설정
            
  - port
    - 클러스터에서 통신 하고자 하는 port 설정
            
  - vpc_security_group_ids
    - **[ ]** 리스트 형식으로 입력
    - 클러스터에서 사용 하고자 하는 SG 설정
  
  - skip_final_snapshot
    - 마지막 스냅샷 생성 여부 설정
    - ture 설정시 스냅샷 생성 안함
      - default 설정값은 **false**
      - false 설정시 **final_snapshot_identifier = " "** 식별자/표현값 참조하여 스냅샷 생성
  
  - db_cluster_parameter_group_name
    - 위에서 생성한 클러스터 파라미터 그룹을 설정
  - db_instance_parameter_group_name
    - 위에서 생성한 파라미터 그룹을 설정

> 참고용 URL
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster

-----
#### RDS db_instance (Aurora) 블럭
```hcl
resource "aws_rds_cluster_instance" "this" {
  count      = 2
  identifier = "test-tf-rds-aurora-${count.index}"
  
  cluster_identifier = aws_rds_cluster.this.id
  db_subnet_group_name    = aws_db_subnet_group.this.id

  instance_class = "db.t3.medium"

  engine            = "aurora-mysql"
  engine_version    = "8.0.mysql_aurora.3.02.0"
  
  
  apply_immediately = false

  copy_tags_to_snapshot = false

  db_parameter_group_name = aws_db_parameter_group.this.id
}
```
+ **resource "aws_rds_cluster_instance" "this" {...} 블럭 생성 진행**
  - count
    - 생성하고자 하는 인스턴스 갯수
  - identifier
    - 생성하고자 하는 인스턴스의 식별자(명칭/이름)
      - count.index 사용하여 생성되는 순번 지정
  
  - cluster_identifier
    - 위에서 생성한 클러스터 설정
  - db_subnet_group_name
    - 위에서 생성한 서브넷 그룹 설정
  
  - instance_class
    - RDS 인스턴스 생성시 type 설정

  - engine
    - RDS 인스턴스 생성시 엔진 설정
  - engine_version
    - RDS 인스턴스 생성시 엔진 버전 설정
      - 선택 가능한 엔진 버전
        - **1.** - 8.0.mysql_aurora.3.02.0
        - **2.** - 5.6.mysql_aurora.1.17.9
        - **3.** - 5.7.mysql_aurora.2.03.2

> 참고용 URL
> - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance

> 참고용 URL (AWS)
> - https://docs.aws.amazon.com/ko_kr/AmazonRDS/latest/AuroraUserGuide/Concepts.DBInstanceClass.html
