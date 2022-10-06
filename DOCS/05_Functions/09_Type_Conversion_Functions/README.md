### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [05.Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md) / [09.Type Conversion Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/09_Type_Conversion_Functions/README.md)

---
### Type Conversion Functions

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
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/03_Collection_Functions/README.md">Collection_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/04_Encoding_Functions/README.md">Encoding_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/05_Filesystem_Functions/README.md">Filesystem_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/06_Date_and_Time_Functions/README.md">Date_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/07_Hash_and_Crypto_Functions/README.md">Hash_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/08_IP_Network_Functions/README.md">IP_Network_Functions</a>
                └── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/09_Type_Conversion_Functions/README.md"><i><b>Type_Conversion_Functions</b></i></a>
</pre>

---

#### can Function

can은 주어진 식을 평가하고 식이 오류 없이 결과를 생성했는지 여부를 나타내는 bool 값을 반환합니다.

이것은 인수를 평가할 때 발생하는 오류를 포착할 수 있는 특수 함수입니다. can을 사용할 수 있는 대부분의 상황에서는 대신 try를 사용하는 것이 좋습니다. 실패한 식에 대한 폴백 값을 보다 간결하게 정의할 수 있기 때문입니다.

can의 주요 목적은 custom variable validation rules을 작성할 때 오류 조건을 부울 유효성 검사 결과로 전환하는 것입니다. 예:

```
variable "timestamp" {
  type        = string
  validation {
    # formatdate fails if the second argument is not a valid timestamp
    condition     = can(formatdate("", var.timestamp))
    error_message = "The timestamp argument requires a valid RFC 3339 timestamp."
  }
}
```

can 함수는 런타임까지 알려지지 않은 데이터에 대한 액세스로 인한 동적 오류만 포착하고 처리할 수 있습니다. 잘못된 형식의 리소스 참조와 같이 입력에 대해 잘못된 것으로 입증될 수 있는 표현식과 관련된 오류는 탐지하지 않습니다.

경고: 캔 기능은 변수 유효성 검사 규칙의 단순 테스트에만 사용됩니다. 기술적으로 모든 종류의 식을 받아들이고 구성의 다른 곳에서 사용할 수 있지만 다른 context에서는 사용하지 않는 것이 좋습니다. 구성의 다른 위치에서 오류를 처리하려면 try를 사용하는 것이 좋습니다.

##### Examples

```
> local.foo
{
  "bar" = "baz"
}
> can(local.foo.bar)
true
> can(local.foo.boop)
false
```

can 함수는 동적 표현식 평가 전이라도 잘못된 구문과 관련된 오류(예: 잘못된 참조 또는 선언되지 않은 최상위 개체에 대한 참조)를 탐지하지 않습니다.

```
> can(local.nonexist)
Error: Reference to undeclared local value
A local value with the name "nonexist" has not been declared.
```

##### Related Functions

- try는 식의 시퀀스를 평가하려고 시도하고 첫 번째 식이 성공한 결과를 반환합니다.

#### defaults Function

참고: 이 기능은 테라폼 0.15 이상에서만 사용할 수 있습니다.

실험: 이 함수는 선택적 속성 실험의 일부이며 module_variable_optional_attrs 실험이 명시적으로 활성화된 모듈에서만 사용할 수 있습니다.

defaults 함수는 입력 변수에 사용할 수 있는 특수 함수로, 유형 제약 조건이 개체 유형 또는 선택적 속성을 포함하는 개체 유형의 집합입니다.

속성을 선택 사항으로 정의하고 호출자가 해당 속성을 명시적으로 제공하지 않으면 테라폼은 속성을 null로 설정하여 생략했음을 나타냅니다. 속성이 설정되지 않은 경우 null이 아닌 자리 표시자 값을 사용하려면 defaults 함수를 사용하여 속성 값이 null로 설정된 경우에만 기본값을 간결하게 할당할 수 있습니다.

```
defaults(input_value, defaults)
```

defaults 함수는 input_value 인수가 정확한 type constraint(아무것도 포함하지 않음)을 가진 입력 변수의 값이 될 것으로 예상합니다. 그런 다음 함수는 중첩된 개체의 속성을 포함하여 데이터 구조의 모든 속성을 방문하고 기본값 개체에 지정된 기본값을 적용합니다.

defaults 인수에 있는 속성의 해석은 input_value에 있는 속성의 유형에 따라 달라집니다.

- Primitive types(string, number, bool): 기본값이 지정된 경우 동일한 이름의 input_value 속성이 null 값을 가질 경우에만 사용됩니다. 기본값의 유형은 입력 값의 유형과 일치해야 합니다.
- Structural types(object and tuple types): 테라폼은 중첩된 값의 모든 속성 또는 요소를 재귀적으로 방문하고 동일한 기본값 병합 논리를 한 단계 더 깊이 반복한다. 기본값의 유형은 입력 값의 유형과 동일해야 하며 개체 유형의 기본값은 입력 값의 유형에 나타나는 특성 이름만 포함해야 합니다.
- Collection types(list, map, and set types): 테라폼은 각 수집 요소를 차례로 방문하고 기본값을 적용합니다. 이 경우 기본값은 컬렉션의 모든 요소에 적용되는 단일 값이기 때문에 컬렉션 유형 자체보다는 컬렉션의 요소 유형과 호환되는 유형을 가져야 합니다.

위의 규칙은 예를 들어 따르는 것이 더 쉬울 수 있다. 다음 테라폼 구성을 고려하십시오.

```
terraform {
  # Optional attributes and the defaults function are
  # both experimental, so we must opt in to the experiment.
  experiments = [module_variable_optional_attrs]
}
variable "storage" {
  type = object({
    name    = string
    enabled = optional(bool)
    website = object({
      index_document = optional(string)
      error_document = optional(string)
    })
    documents = map(
      object({
        source_file  = string
        content_type = optional(string)
      })
    )
  })
}
locals {
  storage = defaults(var.storage, {
    # If "enabled" isn't set then it will default
    # to true.
    enabled = true
    # The "website" attribute is required, but
    # it's here to provide defaults for the
    # optional attributes inside.
    website = {
      index_document = "index.html"
      error_document = "error.html"
    }
    # The "documents" attribute has a map type,
    # so the default value represents defaults
    # to be applied to all of the elements in
    # the map, not for the map itself. Therefore
    # it's a single object matching the map
    # element type, not a map itself.
    documents = {
      # If _any_ of the map elements omit
      # content_type then this default will be
      # used instead.
      content_type = "application/octet-stream"
    }
  })
}
output "storage" {
  value = local.storage
}
```

이를 테스트하기 위해 terraform.tfvars 파일을 생성하여 var.storage에 대한 예제 값을 제공할 수 있습니다.

```
storage = {
  name = "example"
  website = {
    error_document = "error.txt"
  }
  documents = {
    "index.html" = {
      source_file  = "index.html.tmpl"
      content_type = "text/html"
    }
    "error.txt" = {
      source_file  = "error.txt.tmpl"
      content_type = "text/plain"
    }
    "terraform.exe" = {
      source_file  = "terraform.exe"
    }
  }
}
```

위의 값은 선택 사항으로 선언된 속성만 생략하므로 변수의 유형 제약 조건을 준수합니다. Terraform은 다른 값을 평가하기 전에 자동으로 해당 속성을 null 값으로 채운 다음 local.storage의 defaults 함수가 각 속성의 기본값을 대체합니다.

따라서 이 defaults 호출의 결과는 다음과 같습니다.

```
storage = {
  "documents" = tomap({
    "error.txt" = {
      "content_type" = "text/plain"
      "source_file"  = "error.txt.tmpl"
    }
    "index.html" = {
      "content_type" = "text/html"
      "source_file"  = "index.html.tmpl"
    }
    "terraform.exe" = {
      "content_type" = "application/octet-stream"
      "source_file"  = "terraform.exe"
    }
  })
  "enabled" = true
  "name" = "example"
  "website" = {
    "error_document" = "error.txt"
    "index_document" = "index.html"
  }
}
```

enabled 과 website.index_document은 모두 기본값에서 직접 채워진다. 또한 documents의 "terraform.exe" 요소는 content_type 속성을 documents 기본값에서 채워진다. 그러나 기본값이 선택적 속성이 null인 맵의 모든 요소에 동일하게 적용되기 때문에 기본값이 "mapform.exe" 요소 키가 있을 것이라고 예측할 필요가 없다.

#### Using defaults elsewhere

defaults 함수의 설계는 잘 지정된 유형 제약 조건을 가진 입력 값에 의존하므로 유사한 유형(map vs object, list vd tuple) 간의 차이를 안정적으로 인식할 수 있다. 타입 제약조건은 테라폼이 호출자의 값을 제약조건에 적합하도록 변환하도록 하므로 defaults는 적합할 input에 의존할 수 있다.

테라폼 언어의 다른 곳에서는 객체 구성 구문 {...}을 사용하는 경우와 같이 유형에 대한 정확도가 떨어지는 것이 일반적입니다. } 맵인 것처럼 사용할 값을 구성합니다. defaults는 input_value 유형 정보를 사용하기 때문에 입력 변수에서 생성되지 않는 input_value는 적절한 값 유형을 가지지 않는 경향이 있으므로 defaults로 해석되지 않습니다.

첫 번째 인수의 입력 변수 값이 완전히 제한된 경우에만 defaults를 사용하는 것이 좋습니다. 따라서 변수의 유형 제약 조건을 사용하여 수집 유형과 구조 유형을 명시적으로 구분할 수 있습니다.

#### nonsensitive Function

참고: 이 기능은 Terraform v0.15 이상에서만 사용할 수 있습니다.

nonsensitive는 민감 값을 가져와서 민감 마크가 제거된 값의 복사본을 반환하여 sensitive 값을 노출시킵니다.

경고: 이 함수를 무분별하게 사용하면 테라폼이 일반적으로 sensitive라고 간주한 값이 정상 값으로 처리되어 테라폼의 출력에 명확하게 나타나게 된다. 이 함수는 값의 sensitive 부분을 제거하는 방식으로 sensitive값에서 새 값을 도출한 경우에만 사용합니다.

일반적으로 테라폼은 사용자가 식을 사용하여 sensitive라고 표시된 값에서 새 값을 도출할 때 추적하므로 결과도 sensitive로 표시될 수 있습니다.

그러나 sensitive 값에서 non-sensitive 결과를 도출하는 식을 작성할 수도 있습니다. 예를 들어 특정 시스템 및 위협 모델에 대한 세부 정보를 바탕으로 특정 sensitive 값의 SHA256 해시를 테라폼 출력에 명확하게 포함해도 안전하다는 것을 알고 있다면 nonsensitive 함수를 사용하여 테라폼의 일반적인 보수 동작을 재정의하여 다음과 같이 표시할 수 있습니다.

```
output "sensitive_example_hash" {
  value = nonsensitive(sha256(var.sensitive_example))
}
```

또 다른 예는 원래 값이 부분적으로만 sensitive 하다면 sensitive과 non-sensitive 부분을 구분하기 위해 식을 작성한 경우입니다.

```
variable "mixed_content_json" {
  description = "A JSON string containing a mixture of sensitive and non-sensitive values."
  type        = string
  sensitive   = true
}
locals {
  # mixed_content is derived from var.mixed_content_json, so it
  # is also considered to be sensitive.
  mixed_content = jsondecode(var.mixed_content_json)
  # password_from_json is derived from mixed_content, so it's
  # also considered to be sensitive.
  password_from_json = local.mixed_content["password"]
  # username_from_json would normally be considered to be
  # sensitive too, but system-specific knowledge tells us
  # that the username is a non-sensitive fragment of the
  # original document, and so we can override Terraform's
  # determination.
  username_from_json = nonsensitive(local.mixed_content["username"])
}
```

이 함수를 사용할 때 해당 인수로 전달된 식이 종속된 중요한 값에서 모든 중요한 내용을 제거하는지 확인하는 것은 사용자의 책임입니다. nonsensitive값으로 값을 전달하면 중요한 내용에서 파생된 결과 값에도 중요한 내용이 포함되지 않도록 하기 위해 필요한 모든 작업을 완료했음을 테라폼에 선언하게 됩니다. 모듈의 nonsensitive 호출로 인해 Terraform의 출력에 sensitive 값이 나타나면 이는 모듈의 버그이며 Terraform 자체의 버그가 아닙니다. 이 함수는 신중하게 사용해야 합니다.

sensitive로 표시되지 않은 값을 전달할 경우 오류가 반환됩니다. 이러한 호출은 중복되어 모듈의 향후 유지 관리자에 혼란을 주거나 오해의 소지가 있기 때문입니다. 세심한 고려를 거쳐 명확한 의도를 가졌을때만 nonsensitive를 사용한다.

미래의 유지 관리자들에게 어떤 것이 사용을 안전하게 하는지, 따라서 향후 수정 시 보존하기 위해 주의해야 할 사항을 설명하기 위해 사용자가 호출한곳 근처에 comment를 남기는것이 좋다.

##### Examples

다음 예제는 terraform console의 예제에서 변수 "mixed_content_json"과 로컬값 mixed_content로 실행되며 유효한 JSON 문자열이 var.mixed_content_json에 할당되어 있습니다.

```
> var.mixed_content_json
(sensitive)
> local.mixed_content
(sensitive)
> local.mixed_content["password"]
(sensitive)
> nonsensitive(local.mixed_content["username"])
"zqb"
> nonsensitive("clear")
Error: Invalid function argument
Invalid value for "value" parameter: the given value is not sensitive, so this
call is redundant.
```

nonsensitive를 안전할 때만 사용하도록 항상 사용자는 책임을 가져야 합니다. sensitive로 간주되어야 하는 컨텐츠에 nonsensitive 를 사용하는 경우 해당 컨텐츠는 disclose 됩니다.

```
> nonsensitive(var.mixed_content_json)
<<EOT
{
  "username": "zqb",
  "password": "p4ssw0rd"
}
EOT
> nonsensitive(local.mixed_content)
{
  "password" = "p4ssw0rd"
  "username" = "zqb"
}
> nonsensitive(local.mixed_content["password"])
"p4ssw0rd"
```

#### sensitive Function

sensitive는 Terraform이 sensitive input variables와 동일한 의미와 동작으로 sensitive로 처리할 수 있도록 표시된 값의 복사본을 반환합니다.

가능한 경우 이 함수를 사용하는 대신 입력 변수 and/or 출력 값 선언을 직접 민감하게 표시하는 것이 좋습니다. 이 경우 Terraform이 이러한 값을 자동으로 sensitive라고 간주하지 않는 한 이러한 값을 참조할 방법이 없기 때문입니다.

sensitive 함수는 구성의 일부로 디스크에서 중요한 데이터를 로드한 경우와 같이 모듈 내의 정의에서 sensitive 값이 발생하는 일부 일반적인 상황에서 유용할 수 있습니다.

```
locals {
  sensitive_content = sensitive(file("${path.module}/sensitive.txt"))
}
```

그러나 sensitive 값은 일반적으로 모듈의 일부로 정적으로 배포하는 모든 파일에 직접 기록하지 않는 것이 좋습니다. Terraform의 제어 범위 밖의 다른 방법으로 노출될 수 있기 때문입니다.

##### Examples

```
> sensitive(1)
(sensitive)
> sensitive("hello")
(sensitive)
> sensitive([])
(sensitive)
```

#### tobool Function

tobool은 인수를 bool 값으로 변환합니다.

테라폼에서는 필요한 경우 형식을 자동으로 변환하기 때문에 명시적 형식 변환이 거의 필요하지 않습니다. 명시적 형식 변환 함수는 모듈 출력에 반환된 형식을 정규화하는 경우에만 사용하십시오.

bool 값, null 및 정확한 문자열 "true"와 "false"만 bool로 변환할 수 있습니다. 다른 모든 값은 오류를 생성합니다.

##### Examples

```
> tobool(true)
true
> tobool("true")
true
> tobool(null)
null
> tobool("no")
Error: Invalid function argument
Invalid value for "v" parameter: cannot convert "no" to bool: only the strings
"true" or "false" are allowed.
> tobool(1)
Error: Invalid function argument
Invalid value for "v" parameter: cannot convert number to bool.
```

#### tolist Function

tolist는 인수를 목록 값으로 변환합니다.

테라폼에서는 필요한 경우 형식을 자동으로 변환하기 때문에 명시적 형식 변환이 거의 필요하지 않습니다. 명시적 형식 변환 함수는 모듈 출력에 반환된 형식을 정규화하는 경우에만 사용하십시오.

목록에 설정 값을 전달하여 tolist로 변환합니다. 세트 요소가 정렬되지 않았으므로 결과 리스트는 테라폼의 특정 실행 내에서 일관되게 정의되지 않은 순서를 가집니다.

##### Examples

```
> tolist(["a", "b", "c"])
[
  "a",
  "b",
  "c",
]
```

테라폼의 목록 개념은 모든 원소가 동일한 유형이어야 하기 때문에 혼합형 원소는 가장 일반적인 유형으로 변환될 것이다.

```
> tolist(["a", "b", 3])
[
  "a",
  "b",
  "3",
]
```

#### tomap Function

tomap은 인수를 map 값으로 변환합니다.

테라폼에서는 필요한 경우 형식을 자동으로 변환하기 때문에 명시적 형식 변환이 거의 필요하지 않습니다. 명시적 형식 변환 함수는 모듈 출력에 반환된 형식을 정규화하는 경우에만 사용하십시오.

##### Examples

```
> tomap({"a" = 1, "b" = 2})
{
  "a" = 1
  "b" = 2
}
```

테라폼의 map 개념은 모든 원소가 동일한 유형이어야 하기 때문에 혼합형 원소는 가장 일반적인 유형으로 변환될 것이다.

```
> tomap({"a" = "foo", "b" = true})
{
  "a" = "foo"
  "b" = "true"
}
```

#### tonumber Function

tonumber는 인수를 숫자 값으로 변환합니다.

테라폼에서는 필요한 경우 형식을 자동으로 변환하기 때문에 명시적 형식 변환이 거의 필요하지 않습니다. 명시적 형식 변환 함수는 모듈 출력에 반환된 형식을 정규화하는 경우에만 사용하십시오.

숫자, null 및 숫자 10진수 표현을 포함하는 문자열만 숫자로 변환할 수 있습니다. 다른 모든 값은 오류를 생성합니다.

##### Examples

```
> tonumber(1)
1
> tonumber("1")
1
> tonumber(null)
null
> tonumber("no")
Error: Invalid function argument
Invalid value for "v" parameter: cannot convert "no" to number: string must be
a decimal representation of a number.
```

#### toset Function

toset는 인수를 설정된 값으로 변환합니다.

테라폼에서는 필요한 경우 형식을 자동으로 변환하기 때문에 명시적 형식 변환이 거의 필요하지 않습니다. 명시적 형식 변환 함수는 모듈 출력에 반환된 형식을 정규화하는 경우에만 사용하십시오.

list 값을 에 전달하여 집합으로 변환하면 중복 요소가 제거되고 요소의 순서가 무시됩니다.

##### Examples

```
> toset(["a", "b", "c"])
[
  "a",
  "b",
  "c",
]
```

테라폼의 집합 개념은 모든 원소가 동일한 유형이어야 하기 때문에 type이 섞인 원소는 가장 일반적인 type으로 변환될 것이다.

```
> toset(["a", "b", 3])
[
  "3",
  "a",
  "b",
]
```

집합 collection은 순서가 정해져 있지 않으며 중복된 값을 포함할 수 없으므로 인수 요소의 순서가 손실되고 중복된 값이 병합됩니다.

```
> toset(["c", "b", "b"])
[
  "b",
  "c",
]
```

#### tostring Function

tostring은 인수를 문자열 값으로 변환합니다.

테라폼에서는 필요한 경우 type을 자동으로 변환하기 때문에 명시적 type 변환이 거의 필요하지 않습니다. 명시적 type 변환 함수는 모듈 출력에 반환된 type을 정규화하는 경우에만 사용하십시오.

기본 type(string, number, bool)과 null만 문자열로 변환할 수 있습니다. 다른 모든 값은 오류를 생성합니다.

##### Examples

```
> tostring("hello")
hello
> tostring(1)
1
> tostring(true)
true
> tostring(null)
null
> tostring([])
Error: Invalid function argument
Invalid value for "v" parameter: cannot convert tuple to string.
```

#### try Function

try는 모든 인수 식을 차례로 평가하고 오류가 발생하지 않는 첫 번째 인수 식의 결과를 반환합니다.

이것은 인수를 평가할 때 생성되는 오류를 포착할 수 있는 특수 함수로, 구현 시 형태가 잘 알려지지 않은 복잡한 데이터 구조를 작업할 때 특히 유용하다.

예를 들어, 외부 시스템에서 일부 데이터를 JSON 또는 YAML 형식으로 검색한 다음 디코딩하는 경우, 결과에는 설정이 보장되지 않는 속성이 있을 수 있습니다. 따라서 구성의 다른 곳에서 보다 편리하게 사용할 수 있는 예측 가능한 유형을 갖는 표준화된 데이터 구조를 생성하려고 시도할 수 있습니다.

```
locals {
  raw_value = yamldecode(file("${path.module}/example.yaml"))
  normalized_value = {
    name   = tostring(try(local.raw_value.name, null))
    groups = try(local.raw_value.groups, [])
  }
}
```

위의 로컬 값 식을 사용하면 모듈의 다른 위치에서 local.normalized_value 속성을 참조할 수 있습니다. 그렇지 않으면 오류가 발생할 수 있는 없는 속성을 반복적으로 확인하고 처리할 필요가 없습니다.

또한 값이 두 가지 다른 형태로 제공될 수 있는 상황에 대처하는 시도를 사용하여 가장 일반적인 형태로 정규화할 수 있습니다.

```
variable "example" {
  type = any
}
locals {
  example = try(
    [tostring(var.example)],
    tolist(var.example),
  )
}
```

위에서는 var.example이 목록 또는 단일 문자열이 되도록 허용합니다. 단일 문자열이면 해당 문자열을 포함하는 단일 요소 목록으로 정규화되며, 구성의 다른 부분에서 식이 local.example이 항상 목록이라고 가정할 수 있습니다.

이 두 번째 예에는 둘 다 실패할 수 있는 식이 두 개 포함되어 있습니다. 예를 들어 var.example을 {}(으)로 설정한 경우 문자열이나 목록으로 변환할 수 없습니다. 지정된 식을 모두 try 했지만 모두 사용했으면 발생한 모든 문제를 설명하는 오류가 반환됩니다.

우리는 표현식이 정규화를 수행하는 특별한 로컬 값에만 try를 사용하여 오류 처리가 모듈의 단일 위치로 제한되고 모듈의 나머지 부분은 정규화된 구조에 대한 간단한 참조만 사용할 수 있으므로 향후 유지 관리자들이 더 잘 읽을 수 있도록 할 것을 강력히 제안한다.

try 기능은 런타임까지 알려지지 않은 데이터에 대한 액세스로 인한 동적 오류만 포착하고 처리할 수 있습니다. 잘못된 형식의 리소스 참조와 같이 입력에 대해 잘못된 것으로 입증될 수 있는 표현식과 관련된 오류는 탐지하지 않습니다.

경고: try 함수는 객체 속성의 존재와 유형에 대한 간결한 테스트만을 목적으로 합니다. 기술적으로 어떤 종류의 표현도 받아들일 수 있지만, 우리는 위의 예에서 보듯이 단순한 속성 참조와 유형 변환 함수에서만 사용하는 것을 추천한다. 오류를 억제하려는 try를 과도하게 하면 이해하고 유지하기 어려운 구성으로 이어질 수 있습니다.

##### Examples

```
> local.foo
{
  "bar" = "baz"
}
> try(local.foo.bar, "fallback")
baz
> try(local.foo.boop, "fallback")
fallback
```

try 함수는 동적 표현식 평가 전이라도 잘못된 구문과 관련된 오류(예: 잘못된 참조 또는 선언되지 않은 최상위 객체에 대한 참조)를 포착하지 않습니다.

```
> try(local.nonexist, "fallback")
Error: Reference to undeclared local value
A local value with the name "nonexist" has not been declared.
```

##### Related Functions

- can - 식을 평가하고 성공 여부를 나타내는 부울 값을 반환합니다.

#### type Function

type은 지정된 값의 유형을 반환합니다.

때때로 테라폼 구성은 불일치 유형과 관련하여 혼동되는 오류를 발생시킬 수 있습니다. 이 함수는 주어진 값의 유형에 대한 테라폼의 평가를 표시하여 이 오류 메시지를 이해하는 데 유용합니다.

이 기능은 terraform console 명령에서만 사용할 수 있는 특수 기능입니다. 지정된 값의 유형을 검사하는 데만 사용할 수 있으며, 더 복잡한 식에는 사용하지 않아야 합니다.

##### Examples

다음은 var.list 또는 default_list라는 로컬 값을 출력하는 조건부 출력입니다.

```
variable "list" {
  default = []
}
locals {
  default_list = [
    {
      foo = "bar"
      map = { bleep = "bloop" }
    },
    {
      beep = "boop"
    },
  ]
}
output "list" {
  value = var.list != [] ? var.list : local.default_list
}
```

이 구성을 적용하면 다음 오류가 발생합니다.

```
Error: Inconsistent conditional result types
  on main.tf line 18, in output "list":
  18:   value = var.list != [] ? var.list : local.default_list
    |----------------
    | local.default_list is tuple with 2 elements
    | var.list is empty tuple
The true and false result expressions must have consistent types. The given
expressions are tuple and tuple, respectively.
```

이 오류 메시지에는 일부 유형 정보가 포함되어 있지만 Terraform이 각 입력에 대해 결정한 정확한 유형을 검사하는 것이 유용할 수 있습니다. type 함수를 사용하여 var.list와 local.default_list를 모두 검사하면 오류 메시지에 대한 컨텍스트가 더 많아집니다.

```
> type(var.list)
tuple
> type(local.default_list)
tuple([
    object({
        foo: string,
        map: object({
            bleep: string,
        }),
    }),
    object({
        beep: string,
    }),
])
```

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/08_IP_Network_Functions/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
