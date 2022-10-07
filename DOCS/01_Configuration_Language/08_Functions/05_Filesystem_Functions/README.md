### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [05.Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md) / [05.Filesystem Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/05_Filesystem_Functions/README.md)

---
### Filesystem Functions

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
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/05_Filesystem_Functions/README.md"><i><b>Filesystem_Functions</b></i></a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/06_Date_and_Time_Functions/README.md">Date_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/07_Hash_and_Crypto_Functions/README.md">Hash_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/08_IP_Network_Functions/README.md">IP_Network_Functions</a>
                └── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/09_Type_Conversion_Functions/README.md">Type_Conversion_Functions</a>
</pre>

---

#### abspath Function

abspath는 파일 시스템 경로를 포함하는 문자열을 가져와 절대 경로로 변환합니다. 즉, 경로가 절대값이 아닌 경우 현재 작업 디렉토리와 결합됩니다.

리소스 인수의 파일 시스템 경로를 직접 참조하면 여러 시스템에서 또는 다른 호스트 운영 체제에서 동일한 구성이 적용되는 경우 잘못된 diff가 발생할 수 있습니다. 파일 시스템 경로는 파일에 대한 인수(이후 내용만 저장됨)와 같은 임시 값에 대해서만 사용하거나 connection 및 provisioner 블록에 사용하는 것이 좋습니다.

##### Examples

```
> abspath(path.root)
/home/user/some/terraform/root
```

#### dirname Function

dirname은 파일 시스템 경로를 포함하는 문자열을 가져와서 마지막 부분을 제거합니다.

이 함수는 경로 문자열에서만 작동하며 파일 시스템 자체에 액세스하지 않습니다. 따라서 심볼 링크와 같은 파일 시스템 기능을 고려할 수 없다.

경로가 비어 있으면 결과는 현재 작업 디렉토리를 나타내는 "."입니다.

이 기능의 동작은 호스트 플랫폼에 따라 다릅니다. 윈도우즈 시스템에서는 백슬래시 \를 경로 세그먼트 구분자로 사용합니다. 유닉스 시스템에서는 슬래시 /가 사용된다. 이 함수의 결과는 정규화되므로 윈도우즈 시스템에서는 반환하기 전에 지정된 경로에 있는 슬래시가 백슬래시로 대체됩니다.

리소스 인수의 파일 시스템 경로를 직접 참조하면 여러 시스템에서 또는 다른 호스트 운영 체제에서 동일한 구성이 적용되는 경우 잘못된 diff가 발생할 수 있습니다. 파일 시스템 경로는 파일에 대한 인수(이후 내용만 저장됨)와 같은 임시 값에 대해서만 사용하거나 connection 및 provisioner 블록에 사용하는 것이 좋습니다.

##### Examples

```
> dirname("foo/bar/baz.txt")
foo/bar
```

##### Related Functions

- basname은 파일 시스템 경로의 마지막 부분만 반환하고 dirname으로 반환되는 부분은 무시합니다.

#### pathexpand Function

patexpand는 ~ 세그먼트로 시작할 수 있는 파일 시스템 경로를 사용하며, 만약 그렇다면 해당 세그먼트를 현재 사용자의 홈 디렉토리 경로로 바꿉니다.

이 함수는 경로 문자열에서만 작동하며 파일 시스템 자체에 액세스하지 않습니다. 따라서 심볼 링크와 같은 파일 시스템 기능을 고려할 수 없다.

경로의 leading 세그먼트가 ~가 아닌 경우 지정된 경로가 수정되지 않고 반환됩니다.

리소스 인수에 이 함수를 사용하면 홈 디렉토리 경로가 다른 여러 사용자가 동일한 구성을 실행하거나 다른 호스트 운영 체제에서 사용할 경우 잘못된 diff가 발생합니다. SSH 키를 찾기 위한 connection 및 provisioner 블록과 같은 일시적 값에 대해서만 이 기능을 사용하는 것이 좋습니다.

현재 사용자의 "홈 디렉토리"를 결정하는 규칙은 호스트 운영 체제에 따라 다릅니다.

유닉스 시스템의 경우 다음과 같은 소스들을 선호도에 따라 참조한다.

- HOME 환경 변수.
- getent passwd를 실행한 후 Terraform processuid를 실행한 결과입니다.
- sh에서 cd & pwd를 실행한 결과입니다.

윈도우 시스템의 경우 유닉스와 같은 의미에서의 홈 디렉터리의 개념은 존재하지 않지만, 다음의 소스들은 선호도에 따라 참조된다:

- HOME 환경 변수.
- HOMEDRIVE 및 HOMEPATH 환경 변수(둘 다 설정된 경우).
- USERPROFILE 환경 변수.

각 운영 체제에 사용되는 정확한 규칙은 향후 테라폼 릴리스에서 변경될 수 있습니다.

##### Examples

```
> pathexpand("~/.ssh/id_rsa")
/home/steve/.ssh/id_rsa
> pathexpand("/etc/resolv.conf")
/etc/resolv.conf
```

#### basename Function

basename은 파일 시스템 경로를 포함하는 문자열을 가져와서 마지막 부분을 제외한 모든 문자열을 제거합니다.

이 함수는 경로 문자열에서만 작동하며 파일 시스템 자체에 액세스하지 않습니다. 따라서 symlink와 같은 파일 시스템 기능을 고려할 수 없다.

경로가 비어 있으면 결과는 현재 작업 디렉토리를 나타내는 "."입니다.

이 기능의 동작은 호스트 플랫폼에 따라 다릅니다. 윈도우즈 시스템에서는 백슬래시 \를 경로 세그먼트 구분자로 사용합니다. 유닉스 시스템에서는 슬래시 /가 사용된다.

리소스 인수의 파일 시스템 경로를 직접 참조하면 여러 시스템에서 또는 다른 호스트 운영 체제에서 동일한 구성이 적용되는 경우 잘못된 diff가 발생할 수 있습니다. 파일 시스템 경로는 파일에 대한 인수(이후 내용만 저장됨)와 같은 임시 값에 대해서만 사용하거나 connection 및 provisioner 블록에 사용하는 것이 좋습니다.

##### Examples

```
> basename("foo/bar/baz.txt")
baz.txt
```

##### Related Functions

- dirname은 마지막 세그먼트를 제외한 파일 시스템 경로의 모든 세그먼트를 반환하며 기본 이름으로 반환되는 부분은 무시합니다.

#### file Function

file은 지정된 경로에 있는 파일의 내용을 읽고 문자열로 반환합니다.

```
file(path)
```

테라폼 언어의 문자열은 유니코드 문자의 시퀀스이므로 이 함수는 파일 내용을 UTF-8 인코딩된 텍스트로 해석하고 결과 유니코드 문자를 반환합니다. 파일에 잘못된 UTF-8 시퀀스가 포함된 경우 이 함수는 오류를 생성합니다.

이 기능은 테라폼 실행을 시작할 때 디스크에 이미 있는 파일에서만 사용할 수 있습니다. 함수는 종속성 그래프에 포함되지 않으므로 테라폼 작업 중에 동적으로 생성되는 파일에는 이 함수를 사용할 수 없습니다. Terraform 구성에서 동적 로컬 파일을 사용하는 것은 권장하지 않지만, 드물게 필요한 경우 the local_file data source를 사용하여 리소스 종속성을 유지하면서 파일을 읽을 수 있습니다.

##### Examples

```
> file("${path.module}/hello.txt")
Hello World
```

##### Related Functions

- filebase64는 또한 주어진 파일의 내용을 읽지만, 그 내용을 UTF-8 텍스트로 해석하는 대신 Base64로 인코딩된 파일의 원시 바이트를 반환한다.
- file exists는 파일이 지정된 경로에 있는지 여부를 결정합니다.
- templatefile은 디스크의 파일을 템플릿으로 사용하여 렌더링합니다.

#### fileexists Function

fileexists는 파일이 지정된 경로에 있는지 여부를 결정합니다.

```
fileexists(path)
```

함수는 적용 시보다는 구성 구문 분석 중에 평가되므로 이 함수는 테라폼이 작업을 수행하기 전에 디스크에 이미 있는 파일에서만 사용할 수 있습니다.

이 기능은 일반 파일에서만 작동합니다. 디렉터리, FIFO 또는 기타 특수 모드에서 사용할 경우 오류가 반환됩니다.

##### Examples

```
> fileexists("${path.module}/hello.txt")
true
```

```
fileexists("custom-section.sh") ? file("custom-section.sh") : local.default_content
```

##### Related Functions

- file은 지정된 경로에서 파일의 내용을 읽습니다.

#### fileset Function

fileset은 경로와 패턴이 지정된 정규 파일 이름 집합을 열거합니다. 경로는 결과 파일 이름 집합에서 자동으로 제거되며 경로 구분 기호가 포함된 결과는 시스템 간 호환성을 위해 항상 슬래시(/)를 경로 구분 기호로 반환합니다.

```
fileset(path, pattern)
```

지원되는 패턴 일치:

- - - 구분 문자가 아닌 문자 시퀀스와 일치합니다.
- \*\* - 구분 문자를 포함한 모든 문자 시퀀스와 일치합니다.
- ? - 구분 문자가 아닌 단일 문자와 일치합니다.
- {alternative 1,...} - 쉼표로 구분된 대안 중 하나가 일치하는 경우 일련의 문자를 일치시킵니다.
- [CLASS] - 문자 클래스 내에서 구분자가 아닌 단일 문자를 일치시킵니다(아래 참조).
- [^class] - 문자 클래스 외부에 있는 구분자가 아닌 단일 문자와 일치합니다(아래 참조).

doublestar(**)는 경로 구성요소로만 표시되어야 합니다. /path**와 같은 패턴은 유효하지 않으며 /path*와 동일하게 처리되지만 /path*/\*\*는 원하는 결과를 얻어야 합니다.

character class는 다음을 지원합니다.

- [abc] - 집합 내의 모든 단일 문자와 일치합니다.
- [a - z] - 범위 내의 단일 문자와 일치합니다.

함수는 적용 시보다는 구성 구문 분석 중에 평가되므로 이 함수는 테라폼이 작업을 수행하기 전에 디스크에 이미 있는 파일에서만 사용할 수 있습니다.

##### Examples

```
> fileset(path.module, "files/*.txt")
[
  "files/hello.txt",
  "files/world.txt",
]
> fileset(path.module, "files/{hello,world}.txt")
[
  "files/hello.txt",
  "files/world.txt",
]
> fileset("${path.module}/files", "*")
[
  "hello.txt",
  "world.txt",
]
> fileset("${path.module}/files", "**")
[
  "hello.txt",
  "world.txt",
  "subdirectory/anotherfile.txt",
]
```

파일 집합의 일반적인 용도는 일치하는 파일당 하나의 리소스 인스턴스를 생성하는 것이다.

```
resource "example_thing" "example" {
  for_each = fileset(path.module, "files/*")
  # other configuration using each.value
}
```

#### filebase64 Function

filebase64는 지정된 경로에 있는 파일의 내용을 읽고 base64-encoding된 문자열로 반환합니다.

```
filebase64(path)
```

결과는 주어진 파일의 원시 바이트의 Base64 표현입니다. 테라폼 언어의 문자열은 유니코드 문자의 시퀀스이므로 Base64는 유니코드 문자로 해석될 수 없는 원시 이진 데이터를 나타내는 표준 방법이다. 이진 데이터에서 작동하는 리소스 유형은 Base64로 인코딩된 이 데이터를 수락하므로 이 함수의 결과를 디코딩할 필요가 없습니다.

테라폼은 RFC 4648 section 4에 정의된 "standard" Base64 알파벳을 사용한다.

이 함수는 테라폼 실행 시작 시 디스크에 정적 파일로 이미 존재하는 함수와만 사용할 수 있습니다. 언어 함수는 종속성 그래프에 참여하지 않으므로 테라폼 작업 중에 동적으로 생성되는 파일에는 이 함수를 사용할 수 없습니다.

##### Examples

```
> filebase64("${path.module}/hello.txt")
SGVsbG8gV29ybGQ=
```

##### Related Functions

- file은 또한 주어진 파일의 내용을 읽지만 데이터를 UTF-8 텍스트로 해석하고 결과를 문자열로 직접 반환한다.
- base64decode는 UTF-8에서 바이트를 나타내는 Base64 문자열을 디코딩할 수 있지만 실제로는 base64decode(filebase64(...))는 더 짧은 expression file(...)과 동일하다.

#### templatefile Function

templatefile은 지정된 경로에서 파일을 읽고 제공된 템플릿 변수 집합을 사용하여 해당 내용을 템플릿으로 렌더링합니다.

```
templatefile(path, vars)
```

템플릿 구문은 ${ ... }로 구분된 보간 시퀀스를 포함하여 메인 테라폼 언어의 문자열 템플릿과 동일합니다. 이 기능을 사용하면 읽기 쉽도록 긴 템플릿 시퀀스를 별도의 파일로 분해할 수 있습니다.

"vars" 인수는 맵이어야 합니다. 템플릿 파일 내에서 맵의 각 키는 보간용 변수로 사용할 수 있습니다. 템플릿은 또한 templatefile에 대한 재귀 호출이 허용되지 않는 것을 제외하고 테라폼 언어로 사용할 수 있는 다른 함수를 사용할 수 있다. 변수 이름은 각각 문자로 시작하고 0개 이상의 문자, 숫자 또는 밑줄을 사용해야 합니다.

테라폼 언어의 문자열은 유니코드 문자의 시퀀스이므로 이 함수는 파일 내용을 UTF-8 인코딩된 텍스트로 해석하고 결과 유니코드 문자를 반환합니다. 파일에 잘못된 UTF-8 시퀀스가 포함된 경우 이 함수는 오류를 생성합니다.

이 기능은 테라폼 실행을 시작할 때 디스크에 이미 있는 파일에서만 사용할 수 있습니다. 함수는 종속성 그래프에 포함되지 않으므로 테라폼 작업 중에 동적으로 생성되는 파일에는 이 함수를 사용할 수 없습니다.

\*.tftpl은 템플릿 파일에 사용할 권장 명명 패턴입니다. 테라폼은 다른 이름을 사용하는 것을 막지는 않지만, 이 규칙을 따르면 편집자가 내용을 이해하는 데 도움이 되고 결과적으로 더 나은 편집 경험을 제공할 수 있습니다.

##### Examples

###### Lists

다음과 같은 내용이 포함된 템플릿 파일 backends.tftpl이 제공됩니다.

```
%{ for addr in ip_addrs ~}
backend ${addr}:${port}
%{ endfor ~}
```

templatefile 함수는 템플릿을 렌더링합니다.

```
> templatefile("${path.module}/backends.tftpl", { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"] })
backend 10.0.0.1:8080
backend 10.0.0.2:8080
```

###### Maps

다음과 같은 내용이 포함된 템플릿 파일 config.tftpl이 제공됩니다.

```
%{ for config_key, config_value in config }
set ${config_key} = ${config_value}
%{ endfor ~}
```

templatefile 함수는 템플릿을 렌더링합니다.

```
> templatefile(
               "${path.module}/config.tftpl",
               {
                 config = {
                   "x"   = "y"
                   "foo" = "bar"
                   "key" = "value"
                 }
               }
              )
set foo = bar
set key = value
set x = y
```

#### Generating JSON or YAML from a template

생성하려는 문자열이 JSON 또는 YAML 구문일 경우, 많은 개별 보간 시퀀스 및 지시문을 사용할 때 올바르게 해석될 유효한 JSON 또는 YAML을 생성하는 템플릿을 작성하는 것은 까다로울수 있습니다.

대신 jsonencode 또는 yamlencode에 단일 보간 호출로만 구성된 템플릿을 작성하여 다음 예제와 같이 일반 테라폼 expression syntax를 사용하여 인코딩할 값을 지정할 수 있습니다.

```
${jsonencode({
  "backends": [for addr in ip_addrs : "${addr}:${port}"],
})}
${yamlencode({
  "backends": [for addr in ip_addrs : "${addr}:${port}"],
})}
```

이전 섹션의 backends.tftpl 예제와 동일한 입력을 제공하면 이스케이프 또는 구분자를 수동으로 처리할 필요 없이 주어진 데이터 구조의 유효한 JSON 또는 YAML 표현을 생성합니다. 위의 최신 예시에서 ip_addrs elements를 기반으로 하는 반복은 템플릿 지시어를 사용하는 대시 for expression을 사용함으로써 이루어 진다.

```
{"backends":["10.0.0.1:8080","10.0.0.2:8080"]}
```

결과 템플릿이 작은 경우 기본 구성 파일에 jsonencode 또는 yamlencode 호출을 인라인으로 쓰도록 선택할 수 있으며 별도의 템플릿 파일이 생성되지 않도록 할 수 있습니다.

```
locals {
  backend_config_json = jsonencode({
    "backends": [for addr in ip_addrs : "${addr}:${port}"],
  })
}
```

자세한 내용은 jsonencode 및 yamlencode에 대한 기본 설명서를 참조하십시오.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/04_Encoding_Functions/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/06_Date_and_Time_Functions/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
