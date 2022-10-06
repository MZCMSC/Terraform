### IP Network Functions

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/01_Numeric_Functions/README.md">Numeric_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/02_String_Functions/README.md">String_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/03_Collection_Functions/README.md">Collection_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/04_Encoding_Functions/README.md">Encoding_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/05_Filesystem_Functions/README.md">Filesystem_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/06_Date_and_Time_Functions/README.md">Date_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/07_Hash_and_Crypto_Functions/README.md">Hash_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/08_IP_Network_Functions/README.md"><i><b>IP_Network_Functions</b></i></a>
                └── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/09_Type_Conversion_Functions/README.md">Type_Conversion_Functions</a>
</pre>

---

#### cidrhost Function

cidrhost는 지정된 IP 네트워크 주소 접두사 내에서 지정된 호스트 번호에 대한 전체 호스트 IP 주소를 계산합니다.

```
cidrhost(prefix, hostnum)
```

접두사는 RFC 4632 section 3.1에 정의된 대로 CIDR 표기법으로 제공되어야 합니다.

hostnum은 주어진 접두사 뒤에 있는 주소에 남아 있는 자릿수 이하의 이진 정수로 표현될 수 있는 정수이다. 이 함수가 CIDR 접두사를 해석하고 호스트 번호를 채우는 방법에 대한 자세한 내용은 cidrsubnet에 대한 작업 예를 참조하십시오.

전통적으로 호스트 번호 0은 네트워크 자체의 주소를 나타내기 위해 사용되며 모든 호스트 비트를 이진수 1로 채우는 호스트 번호는 네트워크의 브로드캐스트 주소를 나타냅니다. 이러한 숫자는 일반적으로 point-to-point 링크와 같은 비정상적인 상황을 제외하고 개별 호스트를 식별하는 데 사용해서는 안 됩니다.

이 함수는 IPv6 및 IPv4 접두사를 모두 허용하며, 결과는 항상 지정된 접두사와 동일한 주소 지정 체계를 사용합니다.

참고: 이 함수는 선행 0을 갖는 IPv4 주소 옥텟을 10진수로 해석하는데, 이는 다른 시스템에서 8진수로 해석하는 것과 반대된다. 이전 버전과의 호환성을 위해 이 동작을 보존했지만 이 동작에 의존하지 않는 것이 좋습니다.

##### Examples

```
> cidrhost("10.12.112.0/20", 16)
10.12.112.16
> cidrhost("10.12.112.0/20", 268)
10.12.113.12
> cidrhost("fd00:fd12:3456:7890:00a2::/72", 34)
fd00:fd12:3456:7890::22
```

##### Related Functions

- cidrsubnet은 지정된 네트워크 주소 접두사 아래의 서브넷 주소를 계산합니다.

cidrnetmask Function

cidrnetmask는 CIDR 표기법으로 주어진 IPv4 주소 접두사를 서브넷 마스크 주소로 변환한다.

```
cidrnetmask(prefix)
```

prefix는 RFC 4632 section 3.1에 정의된 대로 IPv4 CIDR 표기법으로 제공되어야 합니다.

그 결과 일부 소프트웨어에서 예상한 바와 같이 양식화된 점(dot)이 있는 십진수 IPv4 주소 구문으로 포맷된 서브넷 주소가 생성됩니다.

참고: 이 함수는 선행 0을 갖는 IPv4 주소 옥텟을 10진수로 해석하는데, 이는 다른 시스템에서 8진수로 해석하는 것과 반대된다. 이전 버전과의 호환성을 위해 이 동작을 보존했지만 이 동작에 의존하지 않는 것이 좋습니다.

##### Examples

```
> cidrnetmask("172.16.0.0/12")
255.240.0.0
```

#### cidrsubnet Function

cidrsubnet은 지정된 IP 네트워크 주소 접두사 내의 서브넷 주소를 계산합니다.

```
cidrsubnet(prefix, newbits, netnum)
```

prefix는 RFC 4632 section 3.1에 정의된 대로 CIDR 표기법으로 제공되어야 합니다.

newbits는 접두사를 확장하는 데 사용할 추가 비트 수입니다. 예를 들어, /16으로 끝나는 접두사와 4의 newbits 값이 주어진 경우, 결과 서브넷 주소는 /20의 길이를 가질 것이다.

netnum은 newbits 2진수 이하의 이진수로 표현될 수 있는 정수이며 접두사에 추가되는 추가 비트를 채우는 데 사용됩니다.

이 함수는 IPv6 및 IPv4 접두사를 모두 허용하며, 결과는 항상 지정된 접두사와 동일한 주소 지정 체계를 사용합니다.

cidrsubnets와 달리 cidrsubnet은 사용할 특정 네트워크 번호를 부여할 수 있다. cidrsubnets은 한 번에 여러 네트워크 주소를 할당할 수 있지만 0으로 시작하는 번호를 자동으로 매긴다.

참고: 이 함수는 선행 0을 갖는 IPv4 주소 옥텟을 10진수로 해석하는데, 이는 다른 시스템에서 8진수로 해석하는 것과 반대된다. 이전 버전과의 호환성을 위해 이 동작을 보존했지만 이 동작에 의존하지 않는 것이 좋습니다.

##### Examples

```
> cidrsubnet("172.16.0.0/12", 4, 2)
172.18.0.0/16
> cidrsubnet("10.1.2.0/24", 4, 15)
10.1.2.240/28
> cidrsubnet("fd00:fd12:3456:7890::/56", 16, 162)
fd00:fd12:3456:7800:a200::/72
```

#### Netmasks and Subnets

cidrsubnet을 사용하려면 일부 네트워크 주소 지정 개념에 익숙해야 합니다.

가장 중요한 아이디어는 비록 우리가 전통적으로 4개의 octet(IPv4의 경우) 또는 16비트 16진수(IPv6의 경우)의 시퀀스로 표현하지만 IP 주소(IPv4나 IPv6의 경우)가 기본적으로 이진수로 구성된다는 것입니다.

위의 cidrsubnet("10.1.2.0/24", 4, 15)의 예를 들어, 함수는 먼저 주어진 IP 주소 문자열을 동등한 이진 표현으로 변환한다:

```
      10 .        1 .        2 .        0
00001010   00000001   00000010 | 00000000
         network               |   host
```

접두사 문자열 끝에 있는 /24는 주소의 처음 24비트(또는 처음 3octet)가 네트워크를 식별하고 나머지 비트(32 - 24 = 8비트)가 네트워크 내의 호스트를 식별하도록 지정합니다.

CLI 도구 ipcalc는 CIDR 접두사를 이진 숫자로 시각화하는 데 유용합니다. ipcalc에 동일한 접두사 문자열을 제공하여 위의 변환을 확인할 수 있습니다.

```
$ ipcalc 10.1.2.0/24
Address:   10.1.2.0             00001010.00000001.00000010. 00000000
Netmask:   255.255.255.0 = 24   11111111.11111111.11111111. 00000000
Wildcard:  0.0.0.255            00000000.00000000.00000000. 11111111
=>
Network:   10.1.2.0/24          00001010.00000001.00000010. 00000000
HostMin:   10.1.2.1             00001010.00000001.00000010. 00000001
HostMax:   10.1.2.254           00001010.00000001.00000010. 11111110
Broadcast: 10.1.2.255           00001010.00000001.00000010. 11111111
Hosts/Net: 254                   Class A, Private Internet
```

이는 약간의 추가 정보를 주며 또한 (약간 다른 표기법을 사용하여) 십진수에서 이진수로의 변환을 확인하고 이 네트워크에서 가능한 호스트 주소의 범위를 보여준다.

cidrhost는 단일 호스트 IP 주소를 계산할 수 있지만, cidrsubnet은 주어진 네트워크 접두사 내에 새로운 네트워크 접두사를 만든다. 즉, 서브넷을 생성합니다.

우리가 cidrsubnet을 부를 때 우리는 또한 newbits와 netnum이라는 두 개의 추가 인수를 전달한다. newbits는 결과 접두사가 비트 단위로 얼마나 더 길어질지 결정합니다. 여기서 이 예에서는 4를 지정했습니다. 즉, 결과 서브넷의 접두사 길이가 24 + 4 = 28비트임을 의미합니다. 이러한 비트가 다음과 같이 분해되는 것을 상상할 수 있습니다.

```
      10 .        1 .        2 .    ?        0
00001010   00000001   00000010 |   XXXX | 0000
         parent network        | netnum | host
```

원래 "host number"였던 8비트 중 4비트는 현재 서브넷 번호로 용도 변경되고 있습니다. 네트워크 접두사는 더 이상 정확한 octet 경계에 있지 않으므로, 사실상 IP 주소의 마지막 십진수를 서브넷 번호를 나타내기 위해 반은 사용하고 나머지 반은 호스트 번호를 나타내기 위해 사용하여 두 부분으로 나누고 있습니다.

그런 다음 netnum 인수는 4개의 새로운 서브넷 비트로 인코딩할 숫자 값을 결정합니다. 현재 예제에서는 15를 통과했으며, 이진수로 1111로 표시되므로 위의 XXX 세그먼트를 채울 수 있습니다.

```
      10 .        1 .        2 .    15       0
00001010   00000001   00000010 |   1111 | 0000
         parent network        | netnum | host
```

이것을 다시 일반 십진법 표기법으로 변환하기 위해서는 최종 octet의 두 부분을 재결합해야 한다. 11110000을 이진수에서 10진수로 변환하면 240이 되는데, 이는 새로운 접두사 길이인 28과 결합하여 결과 10.1.2.240/28을 생성할 수 있다. 다시 이 접두사 문자열을 ipcalc에 전달하여 시각화할 수 있습니다.

```
$ ipcalc 10.1.2.240/28
Address:   10.1.2.240           00001010.00000001.00000010.1111 0000
Netmask:   255.255.255.240 = 28 11111111.11111111.11111111.1111 0000
Wildcard:  0.0.0.15             00000000.00000000.00000000.0000 1111
=>
Network:   10.1.2.240/28        00001010.00000001.00000010.1111 0000
HostMin:   10.1.2.241           00001010.00000001.00000010.1111 0001
HostMax:   10.1.2.254           00001010.00000001.00000010.1111 1110
Broadcast: 10.1.2.255           00001010.00000001.00000010.1111 1111
Hosts/Net: 14                    Class A, Private Internet
```

새 서브넷은 호스트 번호 지정에 사용할 수 있는 4비트를 가지고 있습니다. 즉, 네트워크 자체 주소와 브로드캐스트 주소를 빼면 할당에 사용할 수 있는 호스트 주소가 14개입니다. 따라서 cidrhost 함수를 사용하여 1~14 사이의 값을 제공하여 호스트 주소를 계산할 수 있습니다.

```
> cidrhost("10.1.2.240/28", 1)
10.1.2.241
> cidrhost("10.1.2.240/28", 14)
10.1.2.254
```

CIDR 표기법 및 서브넷화에 대한 자세한 내용은 Classless Inter-domain Routing을 참조.

##### Related Functions

- cidrhost는 지정된 네트워크 주소 접두사 내에서 단일 호스트의 IP 주소를 계산합니다.
- cidrnetmask는 CIDR 표기법으로 IPv4 네트워크 접두사를 넷마스크 표기법으로 변환한다.
- cidrsubnet은 한 번에 접두사 아래에 여러 개의 연속된 주소를 할당하여 자동으로 번호를 매길 수 있습니다.

#### cidrsubnets Function

cidrsubnets는 특정 CIDR 접두사 내에서 연속적인 IP 주소 범위의 시퀀스를 계산합니다.

```
cidrsubnets(prefix, newbits...)
```

prefix는 RFC 4632 section 3.1에 정의된 대로 CIDR 표기법으로 제공되어야 합니다.

위의 newbit로 표시된 나머지 인수는 각각 반환된 주소 범위에 대한 추가 네트워크 접두사 비트 수를 지정합니다. 따라서 반환 값은 각각 CIDR 표기법으로 주소 범위를 포함하는 문자열인 newbits 인수당 하나의 요소가 있는 리스트이다.

IP 주소 지정 개념에 대한 자세한 내용은 관련 함수 cidrsubnet 설명서를 참조하십시오. cidrsubnet은 접두사 내의 단일 서브넷 주소를 계산하면서 서브넷 번호를 지정할 수 있는 반면, cidrsubnets는 한 번에 많은 크기를 계산하고 서브넷 번호를 자동으로 할당할 수 있습니다.

이 함수를 사용하여 네트워크 주소 계획의 일부로 주소 공간을 분할하는 경우 네트워크 주소가 실제 인프라에 할당된 후에는 기존 인수를 변경하지 않아야 합니다. 그렇지 않으면 나중에 할당된 주소가 무효화됩니다. 그러나 사용 가능한 주소 공간이 충분한 경우 새 인수를 기존 호출에 안전하게 추가할 수 있습니다.

이 함수는 IPv6 및 IPv4 접두사를 모두 허용하며, 결과는 항상 지정된 접두사와 동일한 주소 지정 체계를 사용합니다.

참고: 이 함수는 선행 0을 갖는 IPv4 주소 octet을 10진수로 해석하는데, 이는 다른 시스템에서 8진수로 해석하는 것과 반대된다. 이전 버전과의 호환성을 위해 이 동작을 보존했지만 이 동작에 의존하지 않는 것이 좋습니다.
참고: 테라폼 모듈 hashicorp/subnets/cidr은 cidrsubnets를 래핑하여 네트워크에 기호 이름을 할당하고 사용되지 않는 할당에 대한 접두사를 건너뛰기 위한 추가 기능을 제공합니다. 문서에는 몇 가지 인기 있는 클라우드 가상 네트워크 플랫폼에 대한 사용 예가 포함되어 있습니다.

##### Examples

```
> cidrsubnets("10.1.0.0/16", 4, 4, 8, 4)
[
  "10.1.0.0/20",
  "10.1.16.0/20",
  "10.1.32.0/24",
  "10.1.48.0/20",
]
> cidrsubnets("fd00:fd12:3456:7890::/56", 16, 16, 16, 32)
[
  "fd00:fd12:3456:7800::/72",
  "fd00:fd12:3456:7800:100::/72",
  "fd00:fd12:3456:7800:200::/72",
  "fd00:fd12:3456:7800:300::/88",
]
```

for expression에 중첩된 cidrsubnets 호출을 사용하여 네트워크 주소 블록 그룹을 간결하게 할당할 수 있습니다.

```
> [for cidr_block in cidrsubnets("10.0.0.0/8", 8, 8, 8, 8) : cidrsubnets(cidr_block, 4, 4)]
[
  [
    "10.0.0.0/20",
    "10.0.16.0/20",
  ],
  [
    "10.1.0.0/20",
    "10.1.16.0/20",
  ],
  [
    "10.2.0.0/20",
    "10.2.16.0/20",
  ],
  [
    "10.3.0.0/20",
    "10.3.16.0/20",
  ],
]
```

##### Related Functions

- cidrhost는 지정된 네트워크 주소 접두사 내에서 단일 호스트의 IP 주소를 계산합니다.
- cidrnetmask는 CIDR 표기법으로 IPv4 네트워크 접두사를 넷마스크 표기법으로 변환한다.
- cidrsubnet은 네트워크 번호를 지정할 수 있도록 단일 서브넷 주소를 계산합니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/07_Hash_and_Crypto_Functions/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/09_Type_Conversion_Functions/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
