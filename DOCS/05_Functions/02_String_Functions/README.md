### String Functions

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Providers/README.md">Providers</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md">Provisioners</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md">Modules</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md">Backends</a>
    └── <a href="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md">Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/01_Numeric_Functions/README.md">Numeric_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/02_String_Functions/README.md"><i><b>String_Functions</b></i></a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/03_Collection_Functions/README.md">Collection_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/04_Encoding_Functions/README.md">Encoding_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/05_Filesystem_Functions/README.md">Filesystem_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/06_Date_and_Time_Functions/README.md">Date_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/07_Hash_and_Crypto_Functions/README.md">Hash_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/08_IP_Network_Functions/README.md">IP_Network_Functions</a>
                └── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/09_Type_Conversion_Functions/README.md">Type_Conversion_Functions</a>
</pre>

---

#### chomp Function

chomp는 문자열 끝에 있는 줄바꿈 문자를 제거합니다.

예를 들어, 끝에 줄바꿈 문자가 있는 파일에서 문자열을 읽은 경우 이 기능이 유용할 수 있습니다.

##### Examples

```
> chomp("hello\n")
hello
> chomp("hello\r\n")
hello
> chomp("hello\n\n")
hello
```

##### Related Functions

- trimspace - 문자열의 시작과 끝 모두에서 모든 유형의 공백을 제거합니다.

#### format Functions

format 함수는 specification 문자열에 따라 다른 여러 값을 포맷하여 문자열을 생성합니다. C의 printf 함수와 다른 프로그래밍 언어의 다른 유사한 함수와 유사하다.

```
format(spec, values...)
```

##### Examples

```
> format("Hello, %s!", "Ander")
Hello, Ander!
> format("There are %d lights", 4)
There are 4 lights
```

%s 및 %d와 같은 단순 형식 동사는 템플릿 보간 구문과 유사하게 동작하며, 이는 종종 더 읽기 쉽다.

```
> format("Hello, %s!", var.name)
Hello, Valentina!
> "Hello, ${var.name}!"
Hello, Valentina!
```

Formatting verb %#v는 모든 유형의 값을 허용하고 jsonencode와 유사한 JSON 인코딩을 사용하여 값을 표시합니다. 이는 사용자 지정 조건 검사 오류 메시지에서 모듈에 제공된 값을 설명하는 데 유용할 수 있습니다.

```
> format("%#v", "hello")
"\"hello\""
> format("%#v", true)
"true"
> format("%#v", 1)
"1"
> format("%#v", {a = 1})
"{\"a\":1}"
> format("%#v", [true])
"[true]"
> format("%#v", null)
"null"
```

format 함수는 더 복잡한 형식 사양을 사용할 때 가장 유용합니다.

##### Specification Syntax

specification은 % character와 함께 도입된 formatting verb를 포함하는 문자열 입니다. function call은 각 특정 verb 시퀀스에 하나의 추가 인수가 있어야 합니다. 주어진 각 인수가 format verb에 필요한 형식으로 변환될 수 있는 한, 동사는 연속적인 인수로 일치되고 지시된 대로 형식이 지정됩니다.

기본적으로 % 시퀀스는 첫 번째 순서로 시작하는 연속 인수를 사용합니다. verb letter 바로 앞에 [n] 시퀀스를 도입하면 n은 십진수 정수이며, one-based 인덱스에 의해 특정 값 인수를 명시적으로 선택합니다. 명시적 인덱스가 없는 후속 호출은 n+1, n+2 등으로 진행됩니다.

이 함수는 형식 문자열이 불가능한 변환을 요청하거나 주어진 것보다 더 많은 인수에 액세스할 경우 오류를 생성합니다. 지원되지 않는 형식 동사에 대해서도 오류가 발생합니다.

##### Verbs

specification에는 다음과 같은 verbs가 포함될 수 있다.

| Verb |                                                        Result                                                         |
| :--: | :-------------------------------------------------------------------------------------------------------------------: |
|  %%  |                                       Literal percent sign, consuming no value.                                       |
|  %v  |     Default formatting based on the value type. Accepts all types, including items of null, list, and map types.      |
| %#v  | JSON serialization of the value, as with jsonencode. Accepts all types, including items of null, list, and map types. |
|  %t  |                                     Convert to boolean and produce true or false.                                     |
|  %b  |                             Convert to integer number and produce binary representation.                              |
|  %d  |                             Convert to integer number and produce decimal representation.                             |
|  %o  |                              Convert to integer number and produce octal representation.                              |
|  %x  |               Convert to integer number and produce hexadecimal representation with lowercase letters.                |
|  %X  |                                          Like %x, but use uppercase letters.                                          |
|  %e  |                        Convert to number and produce scientific notation, like -1.234456e+78.                         |
|  %E  |                              Like %e, but use an uppercase E to introduce the exponent.                               |
|  %f  |                Convert to number and produce decimal fraction notation with no exponent, like 123.456.                |
|  %g  |                                   Like %e for large exponents or like %f otherwise.                                   |
|  %G  |                                   Like %E for large exponents or like %f otherwise.                                   |
|  %s  |                                 Convert to string and insert the string's characters.                                 |
|  %q  |                          Convert to string and produce a JSON quoted string representation.                           |

##### Default Format Verbs

%v를 사용할 경우 테라폼은 value type에 따라 적절한 format verb를 선택합니다.

| Type      | Verb |
| --------- | ---- |
| string    | %s   |
| number    | %g   |
| bool      | %t   |
| any other | %#v  |

null 값은 %v 또는 %#v로 형식이 지정된 경우 null 문자열을 생성하며 다른 verb에 오류가 발생합니다.

##### Width Modifier

값을 나타내는 데 사용할 문자 수를 지정하려면 verb 문자 바로 앞에 있는 옵션으로 십진수 숫자를 가진 width modifier를 사용하십시오. 옵션으로 width 뒤에 period( . )와 precision을 지정할 수 있습니다. width 또는 precision이 생략된 경우 테라폼은 지정된 값을 기준으로 기본값을 선택합니다.

다음의 예들은 width modifier에 대한 사용 사례 예시를 보여준다.

| Sequence | Result                       |
| -------- | ---------------------------- |
| %f       | Default width and precision. |
| %9f      | Width 9, default precision.  |
| %.2f     | Default width, precision 2.  |
| %9.2f    | Width 9, precision 2.        |

##### Additional Format Options

% 기호 바로 뒤에 있는 다음 기호를 사용하여 추가 형식 요구 사항을 설정합니다.

| Symbol | Result                                                         |
| ------ | -------------------------------------------------------------- |
| space  | Leave a space where the sign would be if a number is positive. |
| +      | Show the sign of a number even if it is positive.              |
| -      | Pad the width with spaces on the right rather than the left.   |
| 0      | Pad the width with leading zeros rather than spaces.           |

##### Related Functions

- formatdate는 사람이 사용하는 타임스탬프에 대한 특수 형식 함수입니다.
- formatlist는 동일한 사양 구문을 사용하여 문자열 목록을 생성합니다.

#### formatlist Function

formatlist는 specification 문자열에 따라 다른 여러 값을 포맷하여 문자열 목록을 생성합니다.

```
formatlist(spec, values...)
```

specification 문자열은 형식과 동일한 구문을 사용합니다.

주어진 값은 list 인수와 non-list 인수의 혼합일 수 있습니다. 지정된 list는 동일한 길이여야 하며, 결과 list의 길이를 결정합니다.

list 인수는 인덱스별 순서로 함께 반복되며, non-list 인수는 각 반복에 반복적으로 사용됩니다. 형식 문자열은 list 인수의 요소마다 한 번씩 평가됩니다.

##### Examples

```
> formatlist("Hello, %s!", ["Valentina", "Ander", "Olivia", "Sam"])
[
  "Hello, Valentina!",
  "Hello, Ander!",
  "Hello, Olivia!",
  "Hello, Sam!",
]
> formatlist("%s, %s!", "Salutations", ["Valentina", "Ander", "Olivia", "Sam"])
[
  "Salutations, Valentina!",
  "Salutations, Ander!",
  "Salutations, Olivia!",
  "Salutations, Sam!",
]
```

##### Related Functions

- format은 이 함수에 사용되는 사양 구문을 정의하고 그 결과로 단일 문자열을 생성합니다.

#### indent Function

indent는 주어진 다중 행 문자열에서 첫 번째 줄을 제외한 모든 줄의 시작에 지정된 수의 공백을 추가합니다.

```
indent(num_spaces, string)
```

##### Examples

이 함수는 여러 줄의 문자열을 다른 문자열의 이미 들여쓰기된 컨텍스트에 삽입하는 데 유용합니다.

```
> "  items: ${indent(2, "[\n  foo,\n  bar,\n]\n")}"
  items: [
    foo,
    bar,
  ]
```

문자열의 첫 번째 줄은 들여쓰이지 않으므로, 위와 같이 이미 줄을 시작한 도입 시퀀스 뒤에 배치할 수 있습니다.

#### join Function

join은 지정된 문자열 목록의 모든 요소를 지정된 구분 기호로 연결하여 문자열을 생성합니다.

```
join(separator, list)
```

##### Examples

```
> join(", ", ["foo", "bar", "baz"])
foo, bar, baz
> join(", ", ["foo"])
foo
```

##### Related Functions

- split은 주어진 구분 기호를 사용하여 단일 문자열을 분리하여 목록을 생성하는 반대의 작업을 수행합니다.

#### lower Function

lower는 지정된 문자열의 모든 대소문자를 소문자로 변환합니다.

##### Examples

```
> lower("HELLO")
hello
> lower("АЛЛО!")
алло!
```

이 함수는 대소문자의 유니코드 정의를 사용합니다.

##### Related Functions

- upper는 문자열의 문자를 대문자로 변환합니다.
- title은 문자열에서 각 단어의 첫 번째 문자를 대문자로 변환합니다.

#### regex Function

regex는 문자열에 정규식을 적용하고 일치하는 하위 문자열을 반환합니다.

```
regex(pattern, string)
```

regex의 반환 유형은 패턴의 캡처 그룹에 따라 (있는 경우) 달라진다.

- 패턴에 캡처 그룹이 전혀 없는 경우, 그 결과는 패턴 전체에 의해 일치하는 하위 문자열을 커버 하는 단일 문자열이 된다.
- 패턴에 하나 이상의 이름 없는 캡처 그룹이 있는 경우, 결과는 캡처 그룹의 정의와 동일한 순서로 캡처된 하위 문자열의 목록이 된다.
- 패턴에 하나 이상의 명명된 캡처 그룹이 있는 경우 캡처 그룹 이름을 맵 키로 사용하여 캡처된 하위 문자열의 맵이 생성됩니다.

명명된 캡처 그룹과 명명되지 않은 캡처 그룹을 같은 패턴으로 혼합하는 것은 유효하지 않습니다.

지정된 패턴이 전혀 일치하지 않으면 정규식이 오류를 발생시킵니다. 지정된 패턴이 문자열과 일치하는지 테스트하려면 regexall을 사용하여 결과의 길이가 0보다 큰지 테스트합니다.

| 패턴은 다음 표에 설명된 대로 리터럴 문자와 특수 일치 연산자가 혼합된 문자열입니다. 테라폼 언어로 정규 표현 패턴을 리터럴 따옴표로 묶인 문자열로 지정할 때 따옴표로 묶인 문자열 자체는 이미 문자열의 이스케이프 문자로 백슬래시 \를 사용하므로 패턴의 일부로 인식하려는 백슬래시는 \\로 이스케이프해야 합니다.

| Sequence     | Matches                                                                          |
| ------------ | -------------------------------------------------------------------------------- |
| .            | Any character except newline                                                     |
| [xyz]        | Any character listed between the brackets (x, y, and z in this example)          |
| [a-z]        | Any character between a and z, inclusive                                         |
| [^xyz]       | The opposite of [xyz]                                                            |
| \d           | ASCII digits (0 through 9, inclusive)                                            |
| \D           | Anything except ASCII digits                                                     |
| \s           | ASCII spaces (space, tab, newline, carriage return, form feed)                   |
| \S           | Anything except ASCII spaces                                                     |
| \w           | The same as [0-9A-Za-z_]                                                         |
| \W           | Anything except the characters matched by \w                                     |
| [[:alnum:]]  | The same as [0-9A-Za-z]                                                          |
| [[:alpha:]]  | The same as [A-Za-z]                                                             |
| [[:ascii:]]  | Any ASCII character                                                              |
| [[:blank:]]  | ASCII tab or space                                                               |
| [[:cntrl:]]  | ASCII/Unicode control characters                                                 |
| [[:digit:]]  | The same as [0-9]                                                                |
| [[:graph:]]  | All "graphical" (printable) ASCII characters                                     |
| [[:lower:]]  | The same as [a-z]                                                                |
| [[:print:]]  | The same as [[:graph:]]                                                          |
| [[:punct:]]  | The same as [!-/:-@[-`{-~]                                                       |
| [[:space:]]  | The same as [\t\n\v\f\r ]                                                        |
| [[:upper:]]  | The same as [A-Z]                                                                |
| [[:word:]]   | The same as \w                                                                   |
| [[:xdigit:]] | The same as [0-9A-Fa-f]                                                          |
| \pN          | Unicode character class by using single-letter class names ("N" in this example) |
| \p{Greek}    | Unicode character class by unicode name ("Greek" in this example)                |
| \PN          | The opposite of \pN                                                              |
| \P{Greek}    | The opposite of \p{Greek}                                                        |
| xy           | x followed immediately by y                                                      |
| x\|y         | either x or y, preferring x                                                      |
| x\*          | zero or more x, preferring more                                                  |
| x\*?         | zero or more x, preferring fewer                                                 |
| x+           | one or more x, preferring more                                                   |
| x+?          | one or more x, preferring fewer                                                  |
| x?           | zero or one x, preferring one                                                    |
| x??          | zero or one x, preferring zero                                                   |
| x{n,m}       | between n and m repetitions of x, preferring more                                |
| x{n,m}?      | between n and m repetitions of x, preferring fewer                               |
| x{n,}        | at least n repetitions of x, preferring more                                     |
| x{n,}?       | at least n repetitions of x, preferring fewer                                    |
| x{n}         | exactly n repetitions of x                                                       |
| (x)          | unnamed capture group for sub-pattern x                                          |
| (?P<name>x)  | named capture group, named name, for sub-pattern x                               |
| (?:x)        | non-capturing sub-pattern x                                                      |
| \*           | Literal _ for any punctuation character _                                        |
| \Q...\E      | Literal ... for any text ... as long as it does not include literally \E         |

매치하는 문자를 소비하는 위의 연산자 외에도 문자를 소비하지 않고 매치하는 추가 연산자가 있다. 다음과 같은 "zero-width" 매치 연산자가 있다.

| Sequence | Matches                                                                                  |
| -------- | ---------------------------------------------------------------------------------------- |
| ^        | At the beginning of the given string                                                     |
| $        | At the end of the given string                                                           |
| \A       | At the beginning of the given string                                                     |
| \z       | At the end of the given string                                                           |
| \b       | At an ASCII word boundary (transition between \w and either \W, \A or \z, or vice-versa) |
| \B       | Not at an ASCII word boundary                                                            |

테라폼은 RE2 정규 표현 언어를 사용한다. 이 엔진은 일부 다른 정규 표현식 엔진에서 발견되는 모든 기능을 지원하는것은 아니며, 특히 backreference는 지원하지 않습니다.

##### Matching Flags

위에서 설명한 일치 동작 중 일부는 일치 플래그를 설정하여 수정할 수 있으며, (?flags) 연산자(현재 하위 패턴 내에서 활성화) 또는 (?flags:x) 연산자(수정 플래그와 x를 매치시킴)를 사용하여 활성화할 수 있습니다. 각 플래그는 단일 문자이며 플래그 위치에 여러 문자를 나열하여 한 번에 여러 플래그를 설정할 수 있습니다. 사용 가능한 플래그가 아래 표에 나열되어 있습니다.

| Flag | Meaning                                                                                                                                             |
| ---- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| i    | Case insensitive: a literal letter in the pattern matches both lowercase and uppercase versions of that letter                                      |
| m    | The ^ and $ operators also match the beginning and end of lines within the string, marked by newline characters; behavior of \A and \z is unchanged |
| s    | The . operator also matches newline                                                                                                                 |
| U    | The meaning of presence or absense ? after a repetition operator is inverted. For example, x* is interpreted like x*? and vice-versa.               |

##### Examples

```
> regex("[a-z]+", "53453453.345345aaabbbccc23454")
aaabbbccc
> regex("(\\d\\d\\d\\d)-(\\d\\d)-(\\d\\d)", "2019-02-01")
[
  "2019",
  "02",
  "01",
]
> regex("^(?:(?P<scheme>[^:/?#]+):)?(?://(?P<authority>[^/?#]*))?", "https://terraform.io/docs/")
{
  "authority" = "terraform.io"
  "scheme" = "https"
}
> regex("[a-z]+", "53453453.34534523454")
Error: Error in function call
Call to function "regex" failed: pattern did not match any part of the given
string.
```

##### Related Functions

- regexall은 문자열에서 주어진 패턴과 잠재적으로 일치하는 여러 개의 패턴을 검색합니다.
- replace는 문자열의 하위 문자열을 다른 문자열로 바꿉니다. 선택적으로 regex와 동일한 정규식 구문을 사용하여 일치시킵니다.

Terraform에 이미 일치시키려는 구문을 구문 분석할 수 있는 보다 전문적인 함수가 있는 경우, 대신 해당 함수를 사용하는 것을 선호합니다. 정규 표현식은 읽기 어렵고 의도를 흐리게 하여 구성을 읽고 이해하기 어렵게 만들 수 있습니다.

#### regexall Function

regexall은 문자열에 정규식을 적용하고 모든 일치 항목의 목록을 반환합니다.

```
regexall(pattern, string)
```

regexall은 regex의 변형이며 동일한 패턴 구문을 사용한다. regex에 대한 주어진 입력에 대해 regexall은 regex가 반환했을 유형의 목록을 반환하며 일치당 하나의 요소를 포함합니다. 즉:

- 패턴에 캡처 그룹이 전혀 없는 경우 문자열 목록이 생성됩니다.
- 패턴에 하나 이상의 명명되지 않은 캡처 그룹이 있으면 목록 목록이 생성됩니다.
- 패턴에 하나 이상의 명명된 캡처 그룹이 있으면 맵 목록이 생성됩니다.

regexall은 또한 matches의 resulting list의 길이가 0보다 큰지 테스트함으로써 특정 문자열이 지정된 패턴과 일치하는지 테스트하는 데 사용될 수 있다.

##### Examples

```
> regexall("[a-z]+", "1234abcd5678efgh9")
[
  "abcd",
  "efgh",
]
> length(regexall("[a-z]+", "1234abcd5678efgh9"))
2
> length(regexall("[a-z]+", "123456789")) > 0
false
```

##### Related Functions

- regex는 지정된 패턴과 일치하는 단일 패턴을 검색하고 일치하는 패턴을 찾을 수 없으면 오류를 반환합니다.

Terraform에 이미 일치시키려는 구문을 구문 분석할 수 있는 보다 전문적인 함수가 있는 경우, 대신 해당 함수를 사용하는 것을 선호합니다. 정규 표현식은 읽기 어렵고 의도를 흐리게 하여 구성을 읽고 이해하기 어렵게 만들 수 있습니다.

#### replace Function

replace는 지정된 문자열에서 다른 하위 문자열을 검색하고 각 항목을 지정된 대체 문자열로 바꿉니다.

```
replace(string, substring, replacement)
```

하위 문자열이 슬래시로 감싸여 있으면 정규식과 동일한 패턴 구문을 사용하여 regex로 처리됩니다. 하위 문자열 인수에 정규식을 사용하는 경우 대체 문자열은 $n 시퀀스를 사용하여 입력에서 캡처된 문자열을 통합할 수 있습니다. 여기서 n은 캡처 그룹의 인덱스 또는 이름입니다.

##### Examples

```
> replace("1 + 2 + 3", "+", "-")
1 - 2 - 3
> replace("hello world", "/w.*d/", "everybody")
hello everybody
```

##### Related Functions

- regex는 주어진 정규식 패턴과 일치하는 하위 문자열을 검색합니다.

#### split Function

split은 지정된 구분 기호의 모든 항목에서 지정된 문자열을 분할하여 목록을 생성합니다.

```
split(separator, string)
```

##### Examples

```
> split(",", "foo,bar,baz")
[
  "foo",
  "bar",
  "baz",
]
> split(",", "foo")
[
  "foo",
]
> split(",", "")
[
  "",
]
```

##### Related Functions

- join은 주어진 구분 기호와 함께 문자열 목록을 결합하는 문자열을 생성하는 반대의 작업을 수행한다.

#### strrev Function

strrev는 문자열의 문자를 반전시킵니다. 문자는 유니코드 문자로 처리됩니다(전문 용어로 유니코드 grapheme cluster boundaries는 존중됨).

```
strrev(string)
```

##### Examples

```
> strrev("hello")
olleh
> strrev("a ☃")
☃ a
```

##### Related Functions

- reverse : 역 시퀀스

#### substr Function

하위 문자열은 지정된 문자열에서 오프셋과 (최대) 길이로 하위 문자열을 추출합니다.

##### Examples

```
> substr("hello world", 1, 4)
ello
```

오프셋과 길이는 모두 바이트가 아닌 유니코드 문자로 계산됩니다.

```
> substr("🤔🤷", 0, 1)
🤔
```

오프셋 인덱스는 음수일 수 있으며, 이 경우 지정된 문자열의 끝에 상대적입니다. 길이는 -1일 수 있으며, 이 경우 지정된 오프셋 이후 문자열의 나머지가 반환됩니다.

```
> substr("hello world", -5, -1)
world
```

길이가 문자열 길이보다 크면 하위 문자열은 나머지 모든 문자의 길이가 됩니다.

```
> substr("hello world", 6, 10)
world
```

#### title Function

title은 지정된 문자열에 있는 각 단어의 첫 번째 문자를 대문자로 변환합니다.

##### Examples

```
> title("hello world")
Hello World
```

이 함수는 유니코드의 문자와 대소문자 정의를 사용합니다.

##### Related Functions

- uper는 문자열의 모든 문자를 대문자로 변환합니다.
- lower는 문자열의 모든 문자를 소문자로 변환합니다.

#### trim Function

trim은 지정된 문자열의 시작과 끝에서 지정된 문자 집합을 제거합니다.

```
trim(string, str_character_set)
```

두 번째 인수의 모든 문자는 첫 번째 인수에 지정된 문자열의 시작과 끝에서 제거됩니다.

##### Examples

```
> trim("?!hello?!", "!?")
"hello"
> trim("foobar", "far")
"oob"
> trim("   hello! world.!  ", "! ")
"hello! world."
```

##### Related Functions

- trimprefix는 문자열의 시작에서 단어를 제거합니다.
- trim suffix는 문자열 끝에서 단어를 제거합니다.
- trimspace는 문자열의 시작과 끝 모두에서 모든 유형의 공백을 제거합니다.

#### trimprefix Function

trimprefix는 지정된 문자열의 시작에서 지정된 접두사를 제거합니다. 문자열이 접두사로 시작하지 않으면 문자열은 변경되지 않고 반환됩니다.

##### Examples

```
> trimprefix("helloworld", "hello")
world
> trimprefix("helloworld", "cat")
helloworld
```

##### Related Functions

- trim은 문자열의 시작과 끝에서 문자를 제거합니다.
- trim suffix는 문자열 끝에서 단어를 제거합니다.
- trimspace는 문자열의 시작과 끝 모두에서 모든 유형의 공백을 제거합니다.

#### trimsuffix Function

trim suffix는 지정된 문자열의 끝에서 지정된 접미사를 제거합니다.

##### Examples

```
> trimsuffix("helloworld", "world")
hello
```

##### Related Functions

- trim은 문자열의 시작과 끝에서 문자를 제거합니다.
- trimprefix는 문자열의 시작에서 단어를 제거합니다.
- trimspace는 문자열의 시작과 끝 모두에서 모든 유형의 공백을 제거합니다.

#### trimspace Function

trimspace는 지정된 문자열의 시작과 끝에서 공백 문자를 제거합니다.

이 함수는 유니코드 "space"의 정의를 따르며 regular spaces, tabs, newline characters, and various other space-like characters들을 포함한다.

##### Examples

```
> trimspace("  hello\n\n")
hello
```

##### Related Functions

- chomp는 문자열 끝에서 줄 끝 문자만 제거합니다.

#### upper Function

upper는 지정된 문자열의 모든 대문자를 대문자로 변환합니다.

##### Examples

```
> upper("hello")
HELLO
> upper("алло!")
АЛЛО!
```

이 함수는 유니코드의 문자와 대소문자 정의를 사용합니다.

##### Related Functions

- lower는 문자열의 문자를 소문자로 변환합니다.
- title은 문자열에서 각 단어의 첫 번째 문자를 대문자로 변환합니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/01_Numeric_Functions/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/03_Collection_Functions/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
