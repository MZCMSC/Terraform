### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [05.Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md) / [03.Collection Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/03_Collection_Functions/README.md)

---
### Collection Function

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/01_Numeric_Functions/README.md">Numeric_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/02_String_Functions/README.md">String_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/03_Collection_Functions/README.md"><i><b>Collection_Functions</b></i></a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/04_Encoding_Functions/README.md">Encoding_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/05_Filesystem_Functions/README.md">Filesystem_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/06_Date_and_Time_Functions/README.md">Date_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/07_Hash_and_Crypto_Functions/README.md">Hash_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/08_IP_Network_Functions/README.md">IP_Network_Functions</a>
                └── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/09_Type_Conversion_Functions/README.md">Type_Conversion_Functions</a>
</pre>

---

#### alltrue Function

alltrue는 주어진 집합의 모든 요소가 true이거나 "true"인 경우 true를 반환합니다. 또한 컬렉션이 비어 있으면 true를 반환합니다.

```
alltrue(list)
```

##### Examples

```
> alltrue(["true", true])
true
> alltrue([true, false])
false
```

#### anytrue Function

anytrue는 주어진 집합의 요소가 true이거나 "true"이면 true를 반환합니다. 또한 컬렉션이 비어 있으면 false를 반환합니다.

```
anytrue(list)
```

##### Examples

```
> anytrue(["true"])
true
> anytrue([true])
true
> anytrue([true, false])
true
> anytrue([])
false
```

#### chunklist Function

chunklist는 단일 목록을 고정 크기 청크로 분할하여 목록을 반환합니다.

```
chunklist(list, chunk_size)
```

##### Examples

```
> chunklist(["a", "b", "c", "d", "e"], 2)
[
  [
    "a",
    "b",
  ],
  [
    "c",
    "d",
  ],
  [
    "e",
  ],
]
> chunklist(["a", "b", "c", "d", "e"], 1)
[
  [
    "a",
  ],
  [
    "b",
  ],
  [
    "c",
  ],
  [
    "d",
  ],
  [
    "e",
  ],
]
```

#### coalesce Function

coalesce은 임의의 수의 인수를 사용하고 null 또는 빈 문자열이 아닌 첫 번째 인수를 반환합니다.

모든 인수는 동일한 유형이어야 합니다. 테라폼은 일치하지 않는 인수를 모든 인수가 변환할 수 있는 가장 일반적인 형식으로 변환하거나, 유형이 호환되지 않으면 오류를 반환한다. 결과 유형은 모든 인수의 유형과 동일합니다.

##### Examples

```
> coalesce("a", "b")
a
> coalesce("", "b")
b
> coalesce(1,2)
1
```

문자열 목록을 사용하여 병합 작업을 수행하려면 ... 기호를 사용하여 목록을 인수로 확장하십시오.

```
> coalesce(["", "b"]...)
b
```

테라폼은 모든 인수가 변환할 수 있는 결과 유형을 선택하려고 시도하므로, 인수 유형을 혼합하면 테라폼의 자동 유형 변환 규칙으로 인해 다음과 같은 놀라운 결과를 얻을 수 있다.

```
> coalesce(1, "hello")
"1"
> coalesce(true, "hello")
"true"
> coalesce({}, "hello")
Error: Error in function call
Call to function "coalesce" failed: all arguments must have the same type.
```

#### ##### Related Functions

- coalescelist는 개별 인수가 아닌 목록 인수로 유사한 연산을 수행합니다.

#### coalescelist Function

coalescelist는 임의의 수의 목록 인수를 사용하고 비어 있지 않은 첫 번째 인수를 반환합니다.

##### Examples

```
> coalescelist(["a", "b"], ["c", "d"])
[
  "a",
  "b",
]
> coalescelist([], ["c", "d"])
[
  "c",
  "d",
]
```

lists의 목록을 사용하여 병합 작업을 수행하려면 ... 기호를 사용하여 외부 목록을 인수로 확장하십시오.

```
> coalescelist([[], ["c", "d"]]...)
[
  "c",
  "d",
]
```

##### Related Functions

- collesce는 list 인수가 아닌 string 인수로 유사한 작업을 수행합니다.

#### compact Function

compact는 문자열 목록을 가져와서 빈 문자열 요소가 제거된 새 목록을 반환합니다.

##### Examples

```
> compact(["a", "", "b", "c"])
[
  "a",
  "b",
  "c",
]
```

#### concat Function

concat은 두 개 이상의 목록을 가져와서 하나의 목록으로 결합합니다.

##### Examples

```
> concat(["a", ""], ["b", "c"])
[
  "a",
  "",
  "b",
  "c",
]
```

#### contains Function

contains는 지정된 목록 또는 집합이 지정된 단일 값을 해당 요소 중 하나로 포함하는지 여부를 결정합니다.

```
contains(list, value)
```

##### Examples

```
> contains(["a", "b", "c"], "a")
true
> contains(["a", "b", "c"], "d")
false
```

#### distinct Function

distinct는 목록을 가져와서 중복 요소가 제거된 새 목록을 반환합니다.

각 값의 첫 번째 발생이 유지되고 이러한 요소의 상대적 순서가 유지됩니다.

##### Examples

```
> distinct(["a", "b", "a", "c", "d", "b"])
[
  "a",
  "b",
  "c",
  "d",
]
```

#### element Function

element는 목록에서 단일 요소를 검색합니다.

```
element(list, index)
```

인덱스는 0을 기반으로 합니다. 이 함수를 빈 목록과 함께 사용하면 오류가 발생합니다. 인덱스는 음수가 아닌 정수여야 합니다.

대부분의 경우 기본 제공 인덱스 구문 목록을 사용합니다. 이 기능은 아래에 설명된 특별한 추가 "wrap-around" 동작에만 사용하십시오.

##### Examples

```
> element(["a", "b", "c"], 1)
b
```

지정된 인덱스가 목록의 길이보다 크면 인덱스 모듈을 사용하여 인덱스를 "wrapped around"합니다.

```
> element(["a", "b", "c"], 3)
a
```

목록에서 마지막 요소를 가져오려면 길이를 사용하여 목록의 크기(목록이 zero-based인 경우 1을 뺀 값)를 찾은 다음 마지막 요소를 선택합니다.

```
> element(["a", "b", "c"], length(["a", "b", "c"])-1)
c
```

##### Related Functions

- index는 특정 요소 값에 대한 인덱스를 찾습니다.
- lookup은 map에서 키를 지정하면 값을 검색합니다.

#### flatten Function

flat은 목록을 가져와서 목록인 요소를 목록 내용의 평평한 시퀀스로 바꿉니다.

##### Examples

```
> flatten([["a", "b"], [], ["c"]])
["a", "b", "c"]
```

중첩 리스트 중 하나라도 직접 중첩된 리스트를 포함하는 경우, 이들 역시 재귀적으로 flatten된다.

```
> flatten([[["a", "b"], []], ["c"]])
["a", "b", "c"]
```

맵의 목록과 같이 간접적으로 중첩된 목록은 flatten하지 않습니다.

##### Flattening nested structures for for_each

리소스 for_each와 dynamic block 언어 기능 모두 각 반복 지점마다 하나의 element를 갖는 collection value가 필요하다.

때때로 당신의 입력 데이터 구조가 자연스럽게 for_each 인수에 사용하기에 적합한 모양이 아니며 flatten은 중첩된 데이터 구조를 플랫 구조로 축소할 때 유용한 도우미 함수가 될 수 있습니다.

예를 들어 다음과 같은 변수를 선언하는 모듈을 생각해 보십시오.

```
variable "networks" {
  type = map(object({
    cidr_block = string
    subnets    = map(object({ cidr_block = string }))
  }))
}
```

위의 방법은 최상위 네트워크 및 해당 서브넷과 같이 트리를 자연스럽게 형성하는 객체를 모델링하는 합리적인 방법이다. 최상위 네트워크의 반복은 이 변수를 직접 사용할 수 있는데, 이는 이미 결과 인스턴스가 맵 요소와 일대일 일치하기 때문입니다.

```
resource "aws_vpc" "example" {
  for_each = var.networks
  cidr_block = each.value.cidr_block
}
```

그러나 모든 서브넷을 단일 리소스 블록으로 선언하려면 먼저 구조를 평평하게 하여 각 최상위 요소가 단일 서브넷을 나타내는 컬렉션을 생성해야 합니다.

```
locals {
  # flatten ensures that this local value is a flat list of objects, rather
  # than a list of lists of objects.
  network_subnets = flatten([
    for network_key, network in var.networks : [
      for subnet_key, subnet in network.subnets : {
        network_key = network_key
        subnet_key  = subnet_key
        network_id  = aws_vpc.example[network_key].id
        cidr_block  = subnet.cidr_block
      }
    ]
  ])
}
resource "aws_subnet" "example" {
  # local.network_subnets is a list, so we must now project it into a map
  # where each key is unique. We'll combine the network and subnet keys to
  # produce a single unique key per instance.
  for_each = {
    for subnet in local.network_subnets : "${subnet.network_key}.${subnet.subnet_key}" => subnet
  }
  vpc_id            = each.value.network_id
  availability_zone = each.value.subnet_key
  cidr_block        = each.value.cidr_block
}
```

위의 결과는 서브넷 개체당 하나의 서브넷 인스턴스를 생성하는 동시에 서브넷과 포함된 네트워크 간의 연결을 유지합니다.

##### Related Functions

- setproduct는 여러 목록 또는 값 집합의 모든 조합을 찾으며, 이는 for_each constructs와 함께 사용할 컬렉션을 준비할 때도 유용합니다.

#### index Function

index는 목록에서 지정된 값에 대한 요소 인덱스를 찾습니다.

```
index(list, value)
```

반환된 인덱스는 zero base 입니다. 이 함수는 지정된 값이 목록에 없으면 오류를 생성합니다.

##### Examples

```
> index(["a", "b", "c"], "b")
1
```

##### Related Functions

- element는 해당 인덱스가 지정된 목록에서 특정 요소를 검색합니다.

#### keys Function

keys는 맵을 가져와서 해당 맵의 키를 포함하는 목록을 반환합니다.

key는 사전순으로 반환되므로 맵의 키가 변경되지 않는 한 결과는 동일합니다.

##### Examples

```
> keys({a=1, c=2, d=3})
[
  "a",
  "c",
  "d",
]
```

##### Related Functions

- values는 맵에서 값 목록을 반환합니다.

#### length Functions

length는 지정된 목록, 맵 또는 문자열의 길이를 결정합니다.

목록이나 맵이 주어진 경우 결과는 해당 컬렉션의 요소 수입니다. 문자열을 지정하면 문자열의 문자 수가 됩니다.

##### Examples

```
> length([])
0
> length(["a", "b"])
2
> length({"a" = "b"})
1
> length("hello")
5
```

문자열이 주어졌을 때, 그 결과는 바이트나 유니코드 시퀀스의 수가 아니라 문자의 수이다:

```
> length("👾🕹️")
2
```

"문자(character)"는 유니코드 표준 부속서 29번에서 정의한 대로, 하나의 문자 클러스터이다. 테라폼 제공자는 테라폼의 문자열 표현을 각각의 원격 시스템에서 사용하는 문자열 표현으로 변환하고 추가 검증 규칙을 적용할 책임이 있다.

#### list Function

list 함수는 더 이상 사용할 수 없습니다. 테라폼 v0.12 이전에는 식 안에 literal 목록을 작성할 수 있는 유일한 구문이었지만 테라폼 v0.12는 새로운 1급 구문을 도입했다.

list(a, b, c)과 같은 식을 업데이트하려면 대신 다음을 입력하십시오.

```
tolist([a, b, c])
```

[...] 괄호는 튜플 값을 생성한 다음 tolist 함수가 이를 목록으로 변환합니다. 테라폼 언어의 값 유형에 대한 자세한 내용은 Type Constraints을 참조하십시오.

##### Related Functions

- concat은 다른 목록의 요소를 함께 연결하여 새 목록을 생성합니다.
- tolist는 세트 또는 튜플 값을 목록으로 변환합니다.

#### lookup Function

lookup은 키가 지정된 맵에서 단일 요소의 값을 검색합니다. 지정된 키가 없으면 지정된 default value가 대신 반환됩니다.

```
lookup(map, key, default)
```

과거의 이유로 인해 기본 매개 변수는 실제로 선택 사항입니다. 그러나 기본 생략은 기본 인덱스 구문인 map[key]과 동일하기 때문에 v0.7부터는 더 이상 사용되지 않습니다.

##### Examples

```
> lookup({a="ay", b="bee"}, "a", "what?")
ay
> lookup({a="ay", b="bee"}, "c", "what?")
what?
```

##### Related Functions

- element는 해당 인덱스가 지정된 목록에서 값을 검색합니다.

#### map Function

map 함수는 더 이상 사용할 수 없습니다. 테라폼 v0.12 이전에는 식 안에 리터럴 맵을 쓸 수 있는 유일한 구문이었지만 테라폼 v0.12는 새로운 1급 구문을 도입했다.

map("a", "b", "c", "d")와 같은 식을 업데이트하려면, 대신 다음을 작성하십시오.

```
tomap({
  a = "b"
  c = "d"
})
```

{ ... } 중괄호로 객체 값을 구성한 다음, tomap 함수가 이를 map으로 변환합니다. 테라폼 언어의 값 유형에 대한 자세한 내용은 Type Constraints을 참조하십시오.

##### Related Functions

- tomap은 객체 값을 map으로 변환합니다.
- zipmap은 한 목록에서 키와 다른 목록에서 값을 가져와 동적으로 map을 구성합니다.

#### matchkeys Function

matchkeys는 한 목록에서 인덱스가 다른 목록의 해당 값 인덱스와 일치하는 요소의 하위 집합을 취하여 새 목록을 구성합니다.

```
matchkeys(valueslist, keyslist, searchset)
```

matchkeys는 keylist에서 searchset의 요소와 동일한 인덱스를 식별한 다음 valuelist에서 동일한 인덱스를 가져와서 새 목록을 구성합니다. valuelist와 keylist는 모두 길이가 같아야 합니다.

값 목록의 값 순서가 결과에 유지됩니다.

##### Examples

```
> matchkeys(["i-123", "i-abc", "i-def"], ["us-west", "us-east", "us-east"], ["us-east"])
[
  "i-abc",
  "i-def",
]
```

결과 순서가 유의하지 않은 경우 for expression과 map을 사용하여 유사한 결과를 얻을 수 있습니다.

```
> [for i, z in {"i-123"="us-west","i-abc"="us-east","i-def"="us-east"}: i if z == "us-east"]
[
  "i-def",
  "i-abc",
]
```

관심 있는 키와 값이 개체 목록에 있는 개체의 특성인 경우 해당 목록의 for expression을 사용하여 유사한 결과를 얻을 수도 있습니다.

```
> [for x in [{id="i-123",zone="us-west"},{id="i-abc",zone="us-east"}]: x.id if x.zone == "us-east"]
[
  "i-abc",
]
```

예를 들어 count meta-attribute set가 포함된 resource 블록에서 생성된 리소스 인스턴스 목록과 함께 이전 양식을 사용하여 리소스 속성 중 하나를 일치시켜 인스턴스를 필터링할 수 있습니다.

```
> [for x in aws_instance.example: x.id if x.availability_zone == "us-east-1a"]
[
  "i-abc123",
  "i-def456",
]
```

#### merge Function

merge는 임의의 수의 맵 또는 개체를 사용하며 모든 인수의 병합된 요소 집합을 포함하는 단일 맵 또는 개체를 반환합니다.

둘 이상의 지정된 맵 또는 객체가 동일한 키 또는 속성을 정의하는 경우 인수 시퀀스의 뒷부분이 우선합니다. 인수 유형이 일치하지 않으면 병합 규칙이 적용된 후 결과 유형이 특성의 유형 구조와 일치하는 개체가 됩니다.

##### Examples

```
> merge({a="b", c="d"}, {e="f", c="z"})
{
  "a" = "b"
  "c" = "z"
  "e" = "f"
}
> merge({a="b"}, {a=[1,2], c="z"}, {d=3})
{
  "a" = [
    1,
    2,
  ]
  "c" = "z"
  "d" = 3
}
```

다음 예제에서는 expansion 기호(...)를 사용하여 값을 별도의 인수로 변환합니다. 자세한 내용은 Expanding Function Argument을 참조하십시오.

```
> merge([{a="b", c="d"}, {}, {e="f", c="z"}]...)
{
  "a" = "b"
  "c" = "z"
  "e" = "f"
}
```

#### one Function

one은 0~1개의 요소로 list, set 또는 tuple 값을 취한다. 컬렉션이 비어 있으면 null을 반환합니다. 그렇지 않으면 첫 번째 elements를 반환합니다. elements가 두 개 이상 있으면 오류가 반환됩니다.

이것은 모듈 작성자가 null일 수 있는 단일 값을 반환하기를 원하는, 조건 항목이 0 또는 1 element list으로 표현되는 일반적인 상황을 위해 의도된 특수 함수이다.

예:

```
variable "include_ec2_instance" {
  type    = bool
  default = true
}
resource "aws_instance" "example" {
  count = var.include_ec2_instance ? 1 : 0
  # (other resource arguments...)
}
output "instance_ip_address" {
  value = one(aws_instance.example[*].private_ip)
}
```

위의 aws_instance 리소스에는 0 또는 1을 반환하는 조건으로 설정된 count 인수가 있기 때문에 aws_instance.example의 값은 0 또는 1 element의 목록입니다. instance_ip_address 출력 값은 하나의 함수를 사용하여 단일 인스턴스의 개인 IP 주소를 반환하거나 인스턴스가 생성되지 않은 경우 null을 반환합니다.

##### Relationship to the "Splat" Operator

테라폼 언어에는 splat operator로 알려진 built-in 연산자 [*]가 있으며, 함수 중 하나는 null일 수 있는 원시 값을 0 ~ 1개의 element 목록으로 변환하는 것이다.

```
variable "ec2_instance_type" {
  description = "The type of instance to create. If set to null, no instance will be created."
  type    = string
  default = null
}
resource "aws_instance" "example" {
  count = length(var.ec2_instance_type[*])
  instance_type = var.ec2_instance_type
  # (other resource arguments...)
}
output "instance_ip_address" {
  value = one(aws_instance.example[*].private_ip)
}
```

이 경우, 우리는 하나의 함수가 어떤 의미에서 [*]를 원시 유형 값에 적용하는 것과는 반대라는 것을 알 수 있다. 스플랫은 null일 가능성이 있는 값을 0 또는 1 목록으로 변환할 수 있으며, 이를 반대로 하여 null일 수 있는 원시 값으로 되돌릴 수 있다.

##### Examples

```
> one([])
null
> one(["hello"])
"hello"
> one(["hello", "goodbye"])
Error: Invalid function argument
Invalid value for "list" parameter: must be a list, set, or tuple value with
either zero or one elements.
```

##### Using one with sets

단일 함수는 0 또는 1개의 요소만 있는 집합이 있는 경우에 특히 유용할 수 있습니다. 설정 값은 인덱싱을 지원하지 않으므로 var를 쓰는 것은 유효하지 않습니다.set[0]는 집합의 "첫 번째" 요소를 추출하지만 항목이 하나뿐이라는 것을 알면 해당 단일 항목을 분리하여 반환할 수 있습니다.

```
> one(toset([]))
null
> one(toset(["hello"]))
"hello"
```

둘 이상의 element를 가질 수 있는 집합과 함께 사용하지 마십시오. 이 경우 이 기능은 실패합니다.

```
> one(toset(["hello","goodbye"]))
Error: Invalid function argument
Invalid value for "list" parameter: must be a list, set, or tuple value with
either zero or one elements.
```

#### range Function

range는 start value, limit value 및 step value을 사용하여 숫자 목록을 생성합니다.

```
range(max)
range(start, limit)
range(start, limit, step)
```

start 및 step 인수는 생략할 수 있으며, 이 경우 start는 0으로, step은 start보다 크거나 작은 limit에 따라 1 또는 -1로 기본 설정됩니다.

결과 목록은 지정된 start 값으로 시작하고 결과가 limit 이상이 될 때까지 step을 반복적으로 추가하여 생성됩니다.

limit의 해석은 step의 direction에 따라 달라진다: 양수 step의 경우, 순서는 다음 숫자가 limit보다 크거나 같을 때 완성된다. 음수 step의 경우, 이 값은 보다 작거나 같을 때 완료됩니다.

시퀀스 빌드 알고리즘은 다음과 같은 유사 코드를 따른다.

```
let num = start
while num < limit: (or, for negative step, num > limit)
  append num to the sequence
  num = num + step
return the sequence
```

시퀀스가 메모리의 물리적 목록으로 생성되기 때문에 테라폼은 예를 들어 매우 큰 값이 실수로 limit으로 전달되거나 매우 작은 값이 step으로 전달되는 경우를 방지하기 위해 결과 시퀀스를 인위적으로 1024개의 숫자로 제한한다. 위의 알고리즘이 1025번째 숫자를 시퀀스에 추가하면 함수는 즉시 오류와 함께 종료됩니다.

가능한 경우 range를 만드는 대신 기존 컬렉션에 대해 반복하는 것이 좋습니다. 그러나 작은 숫자 시퀀스를 만드는 것은 collection-multipulation 함수의 다른 컬렉션과 결합하거나 for expression에 유용할 수 있다.

##### Examples

```
> range(3)
[
  0,
  1,
  2,
]
> range(1, 4)
[
  1,
  2,
  3,
]
> range(1, 8, 2)
[
  1,
  3,
  5,
  7,
]
> range(1, 4, 0.5)
[
  1,
  1.5,
  2,
  2.5,
  3,
  3.5,
]
> range(4, 1)
[
  4,
  3,
  2,
]
> range(10, 5, -2)
[
  10,
  8,
  6,
]
```

range 함수는 특정 수의 인스턴스를 생성하기 위해 다른 컬렉션과 작업할 때 주로 유용합니다. 예:

```
variable "name_counts" {
  type    = map(number)
  default = {
    "foo" = 2
    "bar" = 4
  }
}
locals {
  expanded_names = {
    for name, count in var.name_counts : name => [
      for i in range(count) : format("%s%02d", name, i)
    ]
  }
}
output "expanded_names" {
  value = local.expanded_names
}
# Produces the following expanded_names value when run with the default
# "name_counts":
#
# {
#   "bar" = [
#     "bar00",
#     "bar01",
#     "bar02",
#     "bar03",
#   ]
#   "foo" = [
#     "foo00",
#     "foo01",
#   ]
# }
```

##### reverse Function

reverse는 주어진 순서와 동일한 모든 요소를 가지고 동일한 길이의 시퀀스를 역순으로 생성한다.

##### Examples

```
> reverse([1, 2, 3])
[
  3,
  2,
  1,
]
```

##### Related Functions

- strever는 문자열을 뒤집는다.

#### setintersection Function

setintersection 함수는 여러 집합을 취하며 주어진 모든 집합이 공통으로 가지고 있는 요소만을 포함하는 단일 집합을 생성한다. 즉, 집합의 교차점을 계산합니다.

```
setintersection(sets...)
```

##### Examples

```
> setintersection(["a", "b"], ["b", "c"], ["b", "d"])
[
  "b",
]
```

주어진 인수는 집합으로 변환되므로 결과도 집합이며 주어진 요소의 순서가 유지되지 않습니다.

##### Related Functions

- contains는 지정된 목록 또는 집합에 지정된 요소 값이 포함되어 있는지 테스트합니다.
- set product는 여러 집합의 데카르트 곱을 계산합니다.
- set subtract는 두 집합의 상대보수를 계산한다.
- set union은 여러 집합의 합을 계산합니다.

#### setproduct Function

setproduct 함수는 Cartesian product 데카르트 곱을 계산하여 주어진 모든 집합에서 가능한 모든 요소의 조합을 찾는다.

```
setproduct(sets...)
```

이 함수는 애플리케이션별 환경별 리소스와 같이 여러 집합의 멤버 조합의 전체 집합을 찾는 데 특히 유용합니다.

```
> setproduct(["development", "staging", "production"], ["app1", "app2"])
[
  [
    "development",
    "app1",
  ],
  [
    "development",
    "app2",
  ],
  [
    "staging",
    "app1",
  ],
  [
    "staging",
    "app2",
  ],
  [
    "production",
    "app1",
  ],
  [
    "production",
    "app2",
  ],
]
```

이 함수에 최소 두 개의 인수를 전달해야 합니다.

이 함수는 주로 집합에 대해 정의되지만 목록에도 사용할 수 있습니다. 주어진 인수가 모두 리스트라면 결과는 리스트이며, 주어진 리스트의 순서를 유지한다. 그렇지 않으면 결과가 집합입니다. 두 경우 모두 결과의 element type은 주어진 각 인수에 해당하는 값의 list입니다.

##### Examples

위에 이 기능의 일반적인 사용 예제가 있습니다. hand-writting할때는 덜 흔하지만 재사용 가능한 모듈 상황에서 발생할 수 있는 몇 가지 다른 상황이 있다.

만약 어떤 인수가 비어 있다면, 결과는 항상 비게 된다:(어떤 숫자에 0을 곱하면 0이 되는 것과 비슷하게)

```
> setproduct(["development", "staging", "production"], [])
[]
```

```
> setproduct(["a"], ["b"])
[
  [
    "a",
    "b",
  ],
]
```

각 인수에는 모든 요소에 대해 일관된 유형이 있어야 합니다. 그렇지 않으면 테라폼은 가장 일반적인 유형으로 변환을 시도하거나, 그러한 변환이 불가능할 경우 오류를 생성합니다. 예를 들어, 문자열과 숫자를 모두 섞으면 숫자가 문자열로 변환되어 결과 요소들이 모두 일관된 유형을 갖도록 한다.

```
> setproduct(["staging", "production"], ["a", 2])
[
  [
    "staging",
    "a",
  ],
  [
    "staging",
    "2",
  ],
  [
    "production",
    "a",
  ],
  [
    "production",
    "2",
  ],
]
```

##### Finding combination for for_each

for_each 리소스와 dynamic 블록 언어 기능 모두 각 반복마다 한 요소를 갖는 collection 값이 필요하다.

때로는 입력 데이터가 for_each 인수에 직접 사용할 수 없는 별도의 값으로 제공되기도 하며, setproduct는 여러 다른 collection에서 요소의 모든 고유한 조합을 찾으려는 상황에 유용한 도우미 함수가 될 수 있습니다.

예를 들어 다음과 같은 변수를 선언하는 모듈을 생각해 보십시오.

```
variable "networks" {
  type = map(object({
    base_cidr_block = string
  }))
}
variable "subnets" {
  type = map(object({
    number = number
  }))
}
```

정의된 각 네트워크별로 정의된 서브넷을 생성하는 것이 목표인 경우 최상위 네트워크를 생성하는 것은 이미 결과 인스턴스가 맵 요소와 일대일로 일치하는 형태이기 때문에 var.networks를 직접 사용할 수 있습니다.

```
resource "aws_vpc" "example" {
  for_each = var.networks
  cidr_block = each.value.base_cidr_block
}
```

그러나 단일 리소스 블록으로 모든 서브넷을 선언하려면 먼저 각 요소 자체가 서브넷을 나타내도록 네트워크 및 서브넷의 모든 조합을 나타내는 요소를 가진 컬렉션을 생성해야 합니다.

```
locals {
  # setproduct works with sets and lists, but the variables are both maps
  # so convert them first.
  networks = [
    for key, network in var.networks : {
      key        = key
      cidr_block = network.cidr_block
    }
  ]
  subnets = [
    for key, subnet in var.subnets : {
      key    = key
      number = subnet.number
    }
  ]
  network_subnets = [
    # in pair, element zero is a network and element one is a subnet,
    # in all unique combinations.
    for pair in setproduct(local.networks, local.subnets) : {
      network_key = pair[0].key
      subnet_key  = pair[1].key
      network_id  = aws_vpc.example[pair[0].key].id
      # The cidr_block is derived from the corresponding network. Refer to the
      # cidrsubnet function for more information on how this calculation works.
      cidr_block = cidrsubnet(pair[0].cidr_block, 4, pair[1].number)
    }
  ]
}
resource "aws_subnet" "example" {
  # local.network_subnets is a list, so project it into a map
  # where each key is unique. Combine the network and subnet keys to
  # produce a single unique key per instance.
  for_each = {
    for subnet in local.network_subnets : "${subnet.network_key}.${subnet.subnet_key}" => subnet
  }
  vpc_id            = each.value.network_id
  availability_zone = each.value.subnet_key
  cidr_block        = each.value.cidr_block
}
```

위의 예에서 network_subnets 목록은 input 변수의 네트워크와 서브넷 요소의 조합당 하나의 서브넷 인스턴스를 생성합니다. 이 예제 입력의 경우:

```
networks = {
  a = {
    base_cidr_block = "10.1.0.0/16"
  }
  b = {
    base_cidr_block = "10.2.0.0/16"
  }
}
subnets = {
  a = {
    number = 1
  }
  b = {
    number = 2
  }
  c = {
    number = 3
  }
}
```

nework_subnets의 output은 다음과 유사합니다.

```
[
  {
    "cidr_block" = "10.1.16.0/20"
    "network_id" = "vpc-0bfb00ca6173ea5aa"
    "network_key" = "a"
    "subnet_key" = "a"
  },
  {
    "cidr_block" = "10.1.32.0/20"
    "network_id" = "vpc-0bfb00ca6173ea5aa"
    "network_key" = "a"
    "subnet_key" = "b"
  },
  {
    "cidr_block" = "10.1.48.0/20"
    "network_id" = "vpc-0bfb00ca6173ea5aa"
    "network_key" = "a"
    "subnet_key" = "c"
  },
  {
    "cidr_block" = "10.2.16.0/20"
    "network_id" = "vpc-0d193e011f6211a7d"
    "network_key" = "b"
    "subnet_key" = "a"
  },
  {
    "cidr_block" = "10.2.32.0/20"
    "network_id" = "vpc-0d193e011f6211a7d"
    "network_key" = "b"
    "subnet_key" = "b"
  },
  {
    "cidr_block" = "10.2.48.0/20"
    "network_id" = "vpc-0d193e011f6211a7d"
    "network_key" = "b"
    "subnet_key" = "c"
  },
]
```

##### Related Functions

- contains는 지정된 목록 또는 집합에 지정된 요소 값이 포함되어 있는지 테스트합니다.
- flatten은 두 개체 유형 간의 관계가 명시적으로 정의된 상황에서 계층적 데이터를 단일 목록으로 플랫화하는 데 유용합니다.
- set intersection은 여러 집합의 교차점을 계산합니다.
- set subtract는 두 집합의 상대보수를 계산한다.
- set union은 여러 집합의 합을 계산합니다.

#### setsubtract Function

setsubtract 함수는 두 번째 집합에 없는 첫 번째 집합의 요소를 포함하는 새 집합을 반환합니다. 즉, 두 번째 집합의 relative complement(상대적인 보완요소)를 계산합니다.

```
setsubtract(a, b)
```

##### Examples

```
> setsubtract(["a", "b", "c"], ["a", "c"])
[
  "b",
]
```

##### ##### ##### Set Difference (Symmetric Difference)

```
> setunion(setsubtract(["a", "b", "c"], ["a", "c", "d"]), setsubtract(["a", "c", "d"], ["a", "b", "c"]))
[
  "b",
  "d",
]
```

##### Related Functions

- setintersection은 여러 집합의 교차점을 계산합니다.
- setproduct는 여러 집합의 데카르트 곱을 계산합니다.
- setunion은 여러 집합의 합을 계산합니다.

#### setunion Function

setunion 함수는 여러 집합을 취하며 주어진 모든 집합의 원소를 포함하는 단일 집합을 생성한다. 즉, 집합의 합을 계산합니다.

```
setunion(sets...)
```

##### Examples

```
> setunion(["a", "b"], ["b", "c"], ["d"])
[
  "d",
  "b",
  "c",
  "a",
]
```

주어진 인수는 집합으로 변환되므로 결과도 집합이며 주어진 요소의 순서가 유지되지 않습니다.

##### Related Functions

- contains는 지정된 목록 또는 집합에 지정된 요소 값이 포함되어 있는지 테스트합니다.
- setintersection은 여러 집합의 교차점을 계산합니다.
- setproduct는 여러 집합의 데카르트 곱을 계산합니다.
- setsubtract는 두 집합의 상대보수를 계산한다.

#### slice Function

slice는 목록 내에서 몇 가지 연속 요소를 추출합니다.

```
slice(list, startindex, endindex)
```

startindex는 inclusive(포함)이고 endindex는 exclusive(제외)입니다. 이 함수는 두 인덱스 중 하나가 지정된 목록에 대한 유효한 인덱스 범위를 벗어나는 경우 오류를 반환합니다.

##### Examples

```
> slice(["a", "b", "c", "d"], 1, 3)
[
  "b",
  "c",
]
```

##### Related Functions

- substr은 문자열의 문자에 대해 비슷한 기능을 수행하지만, 끝 색인 대신 길이를 사용한다.

#### sort Function

sort는 문자열 목록을 가져와서 해당 문자열이 사전순으로 정렬된 새 목록을 반환합니다.

sort는 유니코드 코드 포인트의 관점에서 이루어지며, 결과에서 낮은 코드 포인트 뒤에 더 높은 코드 포인트가 나타난다.

##### Examples

```
> sort(["e", "d", "a", "x"])
[
  "a",
  "d",
  "e",
  "x",
]
```

#### sum Function

sum은 목록 또는 숫자 집합을 취하여 해당 숫자의 합을 반환합니다.

##### Examples

```
> sum([10, 13, 6, 4.5])
33.5
```

#### transpose Function

transpose는 문자열 목록의 맵을 가져와서 키와 값을 교환하여 문자열 목록의 새 맵을 생성합니다.

##### Examples

```
> transpose({"a" = ["1", "2"], "b" = ["2", "3"]})
{
  "1" = [
    "a",
  ],
  "2" = [
    "a",
    "b",
  ],
  "3" = [
    "b",
  ],
}
```

#### values Function

values는 맵을 가져와서 해당 맵의 elements 값을 포함하는 목록을 반환합니다.

값은 해당 키에 의해 사전순으로 반환되므로 키에서 반환되는 것과 동일한 순서로 반환됩니다.

##### Examples

```
> values({a=3, c=2, d=1})
[
  3,
  2,
  1,
]
```

##### Related Functions

- keys는 맵에서 키 목록을 반환합니다.

#### zipmap Function

zipmap은 키 목록과 그에 상응하는 값 목록으로 맵을 구성한다.

```
zipmap(keyslist, valueslist)
```

keylist와 valuelist는 길이가 같아야 합니다. keyslist는 문자열 목록이어야 하며, valueslist는 모든 유형의 목록일 수 있습니다.

두 목록에서 동일한 인덱스를 가진 각 element pair는 결과 맵에서 element의 key와 value로 사용됩니다. keylist에 동일한 값이 여러 번 나타나면 가장 높은 인덱스를 가진 값이 결과 맵에 사용됩니다.

##### Examples

```
> zipmap(["a", "b"], [1, 2])
{
  "a" = 1
  "b" = 2
}
```

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/02_String_Functions/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/04_Encoding_Functions/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
