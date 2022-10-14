### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [11.Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/README.md) / [04.Encoding Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/04_Encoding_Functions/README.md)

---

#### DOCS TREE


<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/01_Files_and_Directories/README.md">Files_and_Directories</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/02_Syntax/README.md">Syntax</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/03_Resources/README.md">Resources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/04_Data_Sources/README.md">Data_Sources</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/05_Providers/README.md">Providers</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/06_Input_Variables/README.md">Input_Variables</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/07_Output_Values/README.md">Output_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/08_Local_Values/README.md">Local_Values</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/09_Modules/README.md">Modules</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/10_Expressions/README.md">Expressions</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/README.md">Functions</a>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/01_Numeric_Functions/README.md">Numeric_Functions</a>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/02_String_Functions/README.md">String_Functions</a>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/03_Collection_Functions/README.md">Collection_Functions</a>
    │                        │           ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/04_Encoding_Functions/README.md">Encoding_Functions</a></b></i>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/05_Filesystem_Functions/README.md">Filesystem_Functions</a>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/06_Date_and_Time_Functions/README.md">Data_and_Time_Functions</a>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/07_Hash_and_Crypto_Functions/README.md">Hash_and_Crypto_Functions</a>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/08_IP_Network_Functions/README.md">IP_Network_Functions</a>
    │                        │           └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/09_Type_Conversion_Functions/README.md">Type_Conversion_Functions</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/12_Settings/README.md">Settings</a>
    │                        └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/README.md">State</a>  
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>

---

### Encoding Functions

#### base64decode Function

base64 디코드는 Base64 문자 시퀀스를 포함하는 문자열을 가져와서 원래 문자열을 반환합니다.

테라폼은 RFC 4648 section 4에 정의된 "standard" Base64 알파벳을 사용한다.

테라폼 언어의 문자열은 바이트가 아닌 유니코드 문자의 시퀀스이므로, 이 함수는 또한 결과 바이트를 UTF-8로 해석합니다. 만약 Base64 디코딩 후의 바이트가 유효한 UTF-8이 아니라면, 이 함수는 오류를 생성합니다.

테라폼 언어로 대용량 원시 이진 데이터를 조작하는 것은 권장하지 않지만, Base64 인코딩은 임의의 바이트 시퀀스를 나타내는 표준 방법이기 때문에 이진 데이터를 받아들이거나 반환하는 리소스 유형은 Base64 자체를 사용하기 때문에 대부분의 경우 직접 인코딩하거나 디코딩할 필요가 없다. "base64"를 포함하는 이름을 가진 다양한 다른 함수들은 Base64 데이터를 직접 생성하거나 조작할 수 있다.

base64decode는 인코딩 이름이 UTF-8로 설정된 textdecodebase64를 호출하는 줄임말이다.

##### Examples

```
> base64decode("SGVsbG8gV29ybGQ=")
Hello World
```

##### Related Functions

- base64encode는 문자열에 대한 UTF-8 바이트를 Base64로 인코딩하는 반대의 연산을 수행한다.
- textdecodebase64는 UTF-8 이외의 문자 인코딩을 지원하는 더 일반적인 함수이다.
- base64gzip은 문자열에 gzip 압축을 적용하고 Base64 인코딩으로 결과를 반환합니다.
- filebase64는 로컬 파일 시스템에서 파일을 읽고 Base64 인코딩으로 원시 바이트를 반환합니다.

#### base64encode Function

base64encode는 문자열에 Base64 인코딩을 적용합니다.

테라폼은 RFC 4648 섹션 4에 정의된 "standard" Base64 알파벳을 사용한다.

테라폼 언어의 문자열은 바이트가 아닌 유니코드 문자의 시퀀스이므로, 이 함수는 문자열(string)의 문자(character)를 UTF-8로 인코딩한 다음 결과에 Base64 인코딩을 적용합니다.

테라폼 언어는 모든 문자열에 유니코드 정규화를 적용하므로 base64decode와 base64encode을 통해 문자열을 전달하는 것은 원래 결과를 정확하게 산출하지 못할 수 있다.

테라폼 언어로 대용량 원시 이진 데이터를 조작하는 것은 권장하지 않지만 Base64 인코딩은 임의의 바이트 시퀀스를 나타내는 표준 방법이다. Base64 인코딩은 임의의 바이트 시퀀스를 나타내는 표준 방식이기 때문에 이진 데이터를 받아들이거나 반환하는 리소스 유형은 Base64 자체를 사용하므로 이 함수는 Base64 바이트를 예상하는 리소스 유형에 문자열 데이터를 쉽게 제공할 수 있도록 하기 위해 주로 존재한다.

base64encode는 사실상 인코딩 이름이 UTF-8로 설정된 textencodebase64를 호출하기 위한 줄임말이다.

##### Examples

```
> base64encode("Hello World")
SGVsbG8gV29ybGQ=
```

##### Related Functions

- base64 decode는 Base64 데이터를 디코딩하고 UTF-8 문자열로 해석하는 역연산을 수행한다.
- textencodebase64는 UTF-8 이외의 문자 인코딩을 지원하는 더 일반적인 함수이다.
- base64gzip은 문자열에 gzip 압축을 적용하고 한 번의 작업으로 모두 Base64 인코딩으로 결과를 반환합니다.
- filebase64는 로컬 파일 시스템에서 파일을 읽고 중간 유니코드 문자열을 만들지 않고 Base64 인코딩으로 원시 바이트를 반환합니다.

#### base64gzip Function

base64gzip은 gzip으로 문자열을 압축한 다음 결과를 Base64 인코딩으로 인코딩한다.

테라폼은 RFC 4648 section 4에 정의된 "standard" Base64 알파벳을 사용한다.

테라폼 언어의 문자열은 바이트가 아닌 유니코드 문자의 시퀀스이므로, 이 함수는 문자열에서 문자를 UTF-8로 인코딩한 다음 gzip 압축을 적용하고 마지막으로 Base64 인코딩을 적용합니다.

테라폼 언어로 대용량 원시 이진 데이터를 조작하는 것은 권장하지 않지만, 이 기능을 사용하여 테라폼 언어 내에서 생성된 적절한 크기의 텍스트 문자열을 압축할 수 있다. 예를 들어, 이 함수의 결과는 S3 웹 사이트의 일부로 Amazon S3에서 압축된 객체를 만드는 데 사용될 수 있다.

##### Related Functions

- base64 encode는 gzip 압축 없이 Base64 인코딩을 적용합니다.
- filebase64는 로컬 파일 시스템에서 파일을 읽고 Base64 인코딩으로 원시 바이트를 반환합니다.

#### csvdecode Function

csvdecode는 CSV 형식의 데이터를 포함하는 문자열을 디코딩하고 해당 데이터를 나타내는 맵 목록을 생성합니다.

CSV는 표 형식의 데이터에 대해 인코딩 형식으로, 쉼표로 구분된 값입니다. CSV에는 많은 변형이 있지만 이 함수는 RFC 4180에 정의된 형식을 구현합니다.

CSV 데이터의 첫 번째 줄은 "header" 행으로 해석됩니다. 주어진 값은 결과 맵의 키로 사용됩니다. 각 후속 행은 결과 목록에서 단일 맵이 되어 헤더 행의 키를 인덱스별로 지정된 값과 일치시킵니다. 파일의 모든 행에 동일한 수의 필드가 포함되어야 합니다. 그렇지 않으면 이 함수가 오류를 생성합니다

##### Examples

```
> csvdecode("a,b,c\n1,2,3\n4,5,6")
[
  {
    "a" = "1"
    "b" = "2"
    "c" = "3"
  },
  {
    "a" = "4"
    "b" = "5"
    "c" = "6"
  }
]
```

#### Use with the for_each meta-argument

csvdecode의 결과를 for_each 메타 인수와 함께 사용하여 지정된 CSV 파일의 행에 따라 차이점이 설명되는 유사한 개체의 컬렉션을 설명할 수 있습니다.

CSV 파일에는 각 행에 대한 고유 ID로 사용할 수 있는 열이 하나 있어야 하며, 이 열을 for_each 식에서 개별 인스턴스에 대한 추적 키로 사용할 수 있습니다. 예:

```
locals {
  # We've included this inline to create a complete example, but in practice
  # this is more likely to be loaded from a file using the "file" function.
  csv_data = <<-CSV
    local_id,instance_type,ami
    foo1,t2.micro,ami-54d2a63b
    foo2,t2.micro,ami-54d2a63b
    foo3,t2.micro,ami-54d2a63b
    bar1,m3.large,ami-54d2a63b
  CSV
  instances = csvdecode(local.csv_data)
}
resource "aws_instance" "example" {
  for_each = { for inst in local.instances : inst.local_id => inst }
  instance_type = each.value.instance_type
  ami           = each.value.ami
}
```

for_each 인수의 for expression은 csvdecode에 의해 생성된 목록을 local_id를 키로 사용하여 맵으로 변환하며, 이는 테라폼이 생성하는 각 인스턴스를 추적하기 위해 local_id 값을 사용하도록 지시한다. 테라폼은 다음과 같은 인스턴스 주소를 생성하고 관리합니다.

- aws_instance.example["foo1"]
- aws_instance.example["foo2"]
- aws_instance.example["foo3"]
- aws_instance.example["bar1"]

후속 계획에서 CSV의 행을 수정하면 local_id 값이 변경되지 않는 한 Terraform은 이를 기존 개체에 대한 업데이트로 해석합니다. CSV에서 행을 추가하거나 제거하면 Terraform은 관련 인스턴스를 적절하게 생성하거나 삭제하도록 계획합니다.

CSV에서 고유 식별자로 사용할 수 있는 적절한 값이 없는 경우 count 메타 인수를 사용하여 각 CSV 행에 대한 개체를 정의할 수 있습니다. 각 CSV 행은 인덱스로 식별되어 csvdecode가 반환하는 목록에 표시됩니다. 그러나 이 경우 CSV에 대한 향후 업데이트는 목록에서 특정 개체의 위치를 변경하면 중단될 수 있습니다. 향후 변경 시 동작을 더 쉽게 예측할 수 있도록 고유 id 열을 사용하여 for_each를 사용하는 것이 좋습니다.

#### jsondecode Function

jsoncode는 주어진 문자열을 JSON으로 해석하여 해당 문자열을 디코딩한 결과의 표현을 반환한다

JSON 인코딩은 RFC 7159에 정의되어 있다.

이 함수는 다음과 같은 방법으로 JSON 값을 테라폼 언어 값에 매핑합니다.

| JSON type |                  Terraform type                   |
| :-------: | :-----------------------------------------------: |
|  String   |                      string                       |
|  Number   |                      number                       |
|  Boolean  |                       bool                        |
|  Object   | 이 테이블에 따라 특성 유형이 결정되는 object(...) |
|   Array   |  이 표에 따라 element type이 결정되는 tuple(...)  |
|   Null    |                테라폼 언어 null 값                |

테라폼 언어 자동 유형 변환 규칙은 일반적으로 주어진 값에 대해 정확히 어떤 유형이 생성되는지 걱정할 필요가 없으며, 직관적으로 결과를 사용할 수 있다는 것을 의미합니다.

##### Examples

```
> jsondecode("{\"hello\": \"world\"}")
{
  "hello" = "world"
}
> jsondecode("true")
true
```

##### Related Functions

- jsonencode는 값을 JSON으로 인코딩하는 반대의 연산을 수행한다.

#### jsonencode Function

jsonencode는 JSON 구문을 사용하여 주어진 값을 문자열로 인코딩한다.

JSON 인코딩은 RFC 7159에 정의되어 있다.

이 함수는 다음과 같은 방법으로 Terraform language values을 JSON 값으로 매핑합니다.

| Terraform type | JSON type |
| -------------- | --------- |
| string         | String    |
| number         | Number    |
| bool           | Boolean   |
| list(...)      | Array     |
| set(...)       | Array     |
| tuple(...)     | Array     |
| map(...)       | Object    |
| object(...)    | Object    |
| Null value     | null      |

JSON 형식이 모든 테라폼 언어 유형을 완전히 나타낼 수 없기 때문에 jsonencode결과를 jsondecode로 전달하면 동일한 값이 생성되지 않지만 자동 형식 변환 규칙은 실제로 문제가 되는 경우가 거의 없음을 의미한다.

문자열을 인코딩할 때 이 함수는 유니코드 이스케이프 시퀀스를 사용하여 일부 문자를 이스케이프합니다. <, >, &, U+2028 및 U+2029를 \u003c, \u003e, \u0026, \u2028 및 \u2029로 바꿉니다. 이는 테라폼 0.11 동작과의 호환성을 유지하기 위함이다.

jsonencode 명령은 input의 축소된 표현의 output을 명령한다.

##### Examples

```
> jsonencode({"hello"="world"})
{"hello":"world"}
```

##### Related Functions

- jsoncode는 JSON 문자열을 디코딩하여 표현된 값을 얻는 역연산을 수행한다.

#### textdecodebase64 Function

text decodebase64 함수는 이전에 Base64로 인코딩된 문자열을 디코딩한 다음 결과를 지정된 문자 인코딩의 문자로 해석합니다.

테라폼은 RFC 4648 section 4 에 정의된 "표준" Base64 알파벳을 사용한다.

encoding_name 인수는 the IANA character encoding registry에 기록된 인코딩 이름 또는 별칭 중 하나를 포함해야 합니다. 테라폼은 등록된 인코딩의 일부만 지원하며, 인코딩 지원은 테라폼 버전에 따라 다를 수 있다.

테라폼은 인코딩 이름 UTF-8을 사용하며, 이는 base64 디코드와 동일한 결과를 생성한다.

##### Examples

```
> textdecodebase64("SABlAGwAbABvACAAVwBvAHIAbABkAA==", "UTF-16LE")
Hello World
```

##### Related Functions

- textencodebase64는 대상 인코딩을 적용한 후 문자열에 Base64를 적용하는 역(逆) 연산을 수행한다.
- base64decode는 문자 인코딩이 UTF-8로 고정된 텍textdecodebase64의 약어이다.

#### textencodebase64 Function

textencodebase64는 지정된 문자 인코딩을 사용하여 주어진 문자열의 유니코드 문자를 인코딩하며, 테라폼 언어 문자열은 항상 유니코드 문자의 시퀀스이기 때문에 인코딩된 결과 base64를 반환한다.

```
substr(string, encoding_name)
```

테라폼은 RFC 4648 section 4에 정의된 "standard" Base64 알파벳을 사용한다.

encoding_name 인수는 IANA 문자 인코딩 레지스트리에 기록된 인코딩 이름 또는 별칭 중 하나를 포함해야 합니다. 테라폼은 등록된 인코딩의 일부만 지원하며, 인코딩 지원은 테라폼 버전에 따라 다를 수 있다. 특히 테라폼은 윈도우 API의 네이티브 문자 인코딩인 UTF-16LE를 지원한다.

테라폼은 또한 부호화 이름 UTF-8을 받아들이며, 이는 base64encode와 동일한 결과를 생성한다.

##### Examples

```
> textencodebase64("Hello World", "UTF-16LE")
SABlAGwAbABvACAAVwBvAHIAbABkAA==
```

##### Related Functions

- textdecodebase64는 Base64 데이터를 디코딩하고 특정 문자 인코딩으로 해석하는 역연산을 수행한다.
- base64encode는 문자열의 UTF-8 인코딩의 Base64 인코딩을 적용합니다.
- filebase64는 로컬 파일 시스템에서 파일을 읽고 중간 유니코드 문자열을 만들지 않고 Base64 인코딩으로 원시 바이트를 반환합니다.

#### urlencode Function

urlencode는 지정된 문자열에 URL 인코딩을 적용합니다.

이 함수는 URL에 쿼리 문자열 인수로 포함될 때 특별한 의미를 갖는 문자열을 식별하고 RFC 3986 "percent encoding"을 사용하여 문자를 이스케이프합니다.

이스케이프된 문자의 정확한 집합은 시간이 지남에 따라 변경될 수 있지만, 결과는 추가 구분 기호를 실수로 도입하지 않고 쿼리 문자열 인수로 보간될 수 있음을 보장한다.

주어진 문자열에 ASCII가 아닌 문자가 포함되어 있으면 먼저 UTF-8로 인코딩된 다음 백분율 인코딩이 각 UTF-8 바이트에 별도로 적용됩니다.

##### Examples

```
> urlencode("Hello World!")
Hello+World%21
> urlencode("☃")
%E2%98%83
> "http://example.com/search?q=${urlencode("terraform urlencode")}"
http://example.com/search?q=terraform+urlencode
```

#### yamldecode Function

yamdecode는 문자열을 YAML의 하위 집합으로 해석하고 그 값의 표현을 생성한다.

이 함수는 아래에 설명된 대로 YAML 1.2의 하위 집합을 지원합니다.

이 함수는 다음과 같은 방법으로 YAML 값을 Terraform language values에 매핑합니다.

| YAML type   | Terraform type                                      |
| ----------- | --------------------------------------------------- |
| !!str       | string                                              |
| !!float     | number                                              |
| !!int       | number                                              |
| !!bool      | bool                                                |
| !!map       | 테이블에 따라 atrribute type이 결정되는 object(...) |
| !!seq       | 테이블에 따라 element type이 결정되는 tuple(...)    |
| !!null      | 테라폼 언어 null 값                                 |
| !!timestamp | RFC 3339 format의 문자열                            |
| !!binary    | base64-encoded representation을 포함하는 문자열     |

테라폼 언어 자동 유형 변환 규칙은 일반적으로 주어진 값에 대해 정확히 어떤 유형이 생성되는지 걱정할 필요가 없으며, 직관적으로 결과를 사용할 수 있다는 것을 의미합니다.

위의 매핑은 모호하며, 여러 개의 다른 소스 유형이 동일한 대상 유형에 매핑되므로 yamldecode를 통한 라운드 트립과 yamlencode를 통해 동일한 결과를 생성할 수 없습니다.

YAML은 복잡한 언어이며 테라폼 언어의 유형 시스템이 나타낼 수 없는 여러 가지 가능성을 지원한다. 따라서 이 YAML 디코더는 YAML 1.2의 하위 집합만 지원하며 다음과 같은 제한이 있다.

- 이전 anchor에 대한 별칭이 지원되지만 순환 데이터 구조(이 컬렉션에 대한 참조가 해당 컬렉션 내부에 나타나는 경우)는 지원되지 않습니다. yamldecode가 그러한 구조를 감지하면 오류를 반환합니다.
- 위의 표에 표시된 형식 태그(또는 동일한 태그의 동등한 대체 표현)만 지원됩니다. 다른 태그가 있으면 오류가 발생합니다.
- 하나의 YAML 문서만 허용됩니다. 지정된 문자열에 여러 개의 문서가 있으면 이 함수는 오류를 반환합니다.

##### Examples

```
> yamldecode("hello: world")
{
  "hello" = "world"
}
> yamldecode("true")
true
> yamldecode("{a: &foo [1, 2, 3], b: *foo}")
{
  "a" = [
    1,
    2,
    3,
  ]
  "b" = [
    1,
    2,
    3,
  ]
}
> yamldecode("{a: &foo [1, *foo, 3]}")
Error: Error in function call
Call to function "yamldecode" failed: cannot refer to anchor "foo" from inside
its own definition.
> yamldecode("{a: !not-supported foo}")
Error: Error in function call
Call to function "yamldecode" failed: unsupported tag "!not-supported".
```

##### Related Functions

- Json 코드는 YAML 대신 JSON을 사용하는 유사한 작업이다.
- yamlencode는 값을 YAML로 인코딩하는 반대 연산을 수행합니다.

#### yamlencode Function

yamlencode는 주어진 값을 YAML 1.2 블록 구문을 사용하여 문자열로 인코딩한다.

경고: 이 함수는 현재 실험 중이며 정확한 결과 형식은 피드백에 따라 향후 테라폼 버전에서 변경될 수 있다. 결과를 변경할 경우 중단될 수 있는 리소스 인수에 대한 값을 구성하기 위해 yamldecode를 사용하지 마십시오. 값의 일관된 문자열 표현을 얻으려면 대신 jsonencode를 사용하십시오. YAML은 JSON 슈퍼셋이기 때문에 그 결과도 유효한 YAML입니다.

이 함수는 다음과 같은 방법으로 테라폼 언어 값을 YAML 태그에 매핑합니다.

| Terraform type | YAML type        |
| -------------- | ---------------- |
| string         | !!str            |
| number         | !!float or !!int |
| bool           | !!bool           |
| list(...)      | !!seq            |
| set(...)       | !!seq            |
| tuple(...)     | !!seq            |
| map(...)       | !!map            |
| object(...)    | !!map            |
| Null value     | !!null           |

yamlencode는 위의 모든 유형에 대해 암시적인 구문을 사용하므로 명시적인 YAML 태그를 생성하지 않는다.

YAML 형식이 모든 테라폼 언어 유형을 완전히 나타낼 수 없기 때문에 yamlencode 결과를 yamldecode로 전달하는 것은 동일한 값을 생성하지 않지만 테라폼 언어 자동 유형 변환 규칙은 이것이 실제로 거의 문제가 되지 않는다는 것을 의미한다.

##### Examples

```
> yamlencode({"a":"b", "c":"d"})
"a": "b"
"c": "d"
> yamlencode({"foo":[1, 2, 3], "bar": "baz"})
"bar": "baz"
"foo":
- 1
- 2
- 3
> yamlencode({"foo":[1, {"a":"b","c":"d"}, 3], "bar": "baz"})
"bar": "baz"
"foo":
- 1
- "a": "b"
  "c": "d"
- 3
```

yamlencode는 매핑이나 시퀀스가 비어 있지 않은 한 항상 YAML의 "block style"을 매핑과 시퀀스에 사용한다. 흐름 스타일 YAML을 생성하려면 대신 jsonencode를 사용하십시오. YAML 흐름 스타일은 JSON 구문의 상위 집합입니다.

##### Related Functions

- Jsonencode는 YAML 대신 JSON을 사용하는 유사한 연산이다.
- yamdecode는 YAML 문자열을 디코딩하여 표시된 값을 얻으면서 역(逆) 연산을 수행합니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/03_Collection_Functions/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/05_Filesystem_Functions/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
