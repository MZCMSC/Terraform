### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [01.Configuration Language](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md) / [11.Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/README.md) / [06.Date and Time Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/06_Date_and_Time_Functions/README.md)

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
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/04_Encoding_Functions/README.md">Encoding_Functions</a>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/05_Filesystem_Functions/README.md">Filesystem_Functions</a>
    │                        │           ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/06_Date_and_Time_Functions/README.md">Data_and_Time_Functions</a></b></i>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/07_Hash_and_Crypto_Functions/README.md">Hash_and_Crypto_Functions</a>
    │                        │           ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/08_IP_Network_Functions/README.md">IP_Network_Functions</a>
    │                        │           └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/11_Functions/09_Type_Conversion_Functions/README.md">Type_Conversion_Functions</a>
    │                        ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/12_Settings/README.md">Settings</a>
    │                        └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/13_State/README.md">State</a>  
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Backends/README.md">Backends</a>

---

### Date and Time Functions

#### formatdate Function

formatdate는 타임스탬프를 다른 시간 형식으로 변환합니다.

```
formatdate(spec, timestamp)
```

테라폼 언어에서 timestamp는 RFC 3339 "Date and Time format" 구문을 사용하는 문자열로 표현된다. formatdate를 사용하려면 timestamp 인수가 이 구문을 준수하는 문자열이어야 합니다.

##### Examples

```
> formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")
02 Jan 2018 23:12 UTC
> formatdate("EEEE, DD-MMM-YY hh:mm:ss ZZZ", "2018-01-02T23:12:01Z")
Tuesday, 02-Jan-18 23:12:01 UTC
> formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ", "2018-01-02T23:12:01-08:00")
Tue, 02 Jan 2018 23:12:01 -0800
> formatdate("MMM DD, YYYY", "2018-01-02T23:12:01Z")
Jan 02, 2018
> formatdate("HH:mmaa", "2018-01-02T23:12:01Z")
11:12pm
```

#### Specification Syntax

형식 지정은 다음 표의 형식 지정 시퀀스를 포함하는 문자열입니다. 이 함수는 RFC822, RFC850 및 RFC1123에 정의된 것과 같은 일반적인 기계 지향 타임스탬프 형식을 생성하기 위한 것입니다. locale을 인식하지 못하기 때문에 진정한 인간 지향적인 날짜 형식에 적합하지 않습니다. 특히 영어로만 월, 일 이름을 만들 수 있습니다.

사양에는 다음과 같은 시퀀스가 포함될 수 있습니다.

| Sequence | Result                                                                  |
| -------- | ----------------------------------------------------------------------- |
| YYYY     | Four (or more) digit year, like "2006".                                 |
| YY       | The year modulo 100, zero padded to at least two digits, like "06".     |
| MMMM     | English month name unabbreviated, like "January".                       |
| MMM      | English month name abbreviated to three letters, like "Jan".            |
| MM       | Month number zero-padded to two digits, like "01" for January.          |
| M        | Month number with no padding, like "1" for January.                     |
| DD       | Day of month number zero-padded to two digits, like "02".               |
| D        | Day of month number with no padding, like "2".                          |
| EEEE     | English day of week name unabbreviated, like "Monday".                  |
| EEE      | English day of week name abbreviated to three letters, like "Mon".      |
| hh       | 24-hour number zero-padded to two digits, like "02".                    |
| h        | 24-hour number unpadded, like "2".                                      |
| HH       | 12-hour number zero-padded to two digits, like "02".                    |
| H        | 12-hour number unpadded, like "2".                                      |
| AA       | Hour AM/PM marker in uppercase, like "AM".                              |
| aa       | Hour AM/PM marker in lowercase, like "am".                              |
| mm       | Minute within hour zero-padded to two digits, like "05".                |
| m        | Minute within hour unpadded, like "5".                                  |
| ss       | Second within minute zero-padded to two digits, like "09".              |
| s        | Second within minute, like "9".                                         |
| ZZZZZ    | Timezone offset with colon separating hours and minutes, like "-08:00". |
| ZZZZ     | Timezone offset with just sign and digit, like "-0800".                 |
| ZZZ      | Like ZZZZ but with a special case "UTC" for UTC.                        |
| Z        | Like ZZZZZ but with a special case "Z" for UTC.                         |

구두법(verbatim)과 같이 글자가 아닌 모든 문자(character)는 출력에 글자 그대로 재생산됩니다. 형식 문자열에 문자 그대로를 포함하려면 따옴표 '로 묶으십시오. 리터럴 따옴표를 포함하려면 따옴표를 두 배로 늘려서 이스케이프합니다.

```
> formatdate("h'h'mm", "2018-01-02T23:12:01-08:00")
23h12
> formatdate("H 'o''clock'", "2018-01-02T23:12:01-08:00")
11 o'clock
```

이 형식 지정 구문은 독자가 구문의 전문가가 아니더라도 어떤 형식이 나올지 쉽게 추측할 수 있도록 하기 위한 것이다. 따라서 공통 형식에 대한 미리 정의된 단축키는 없지만, 필요에 따라 구성에 복사하기 위해 다양한 RFC 지정 형식에 대한 형식 문자열이 아래에 제공됩니다.

- RFC 822 and RFC RFC 2822: "DD MMM YYYY hh:mm ZZZ"
- RFC 850: "EEEE, DD-MMM-YY hh:mm:ss ZZZ"
- RFC 1123: "EEE, DD MMM YYYY hh:mm:ss ZZZ"
- RFC 3339: "YYYY-MM-DD'T'hh:mm:ssZ" (그러나 이것은 입력 형식이기도 하므로 이러한 변환은 중복됩니다.)

##### Related Functions

- format은 임의 데이터에 대한 보다 일반적인 포맷 함수이다.
- timestamp는 현재 날짜 및 시간을 형식 지정에 적합한 형식으로 반환합니다.

#### timeadd Function

timeadd는 타임스탬프에 기간을 추가하여 새 타임스탬프를 반환합니다.

```
timeadd(timestamp, duration)
```

테라폼 언어에서 타임스탬프는 전통적으로 RFC 3339 "Date and Time format" 구문을 사용하는 문자열로 표현된다. timeadd는 timestamp 인수를 이 구문에 맞는 문자열이어야 한다.

duration은 "1.5h" 또는 "1h30m"와 같은 숫자와 단위 쌍의 시퀀스로 구성된 시간 차이를 나타내는 문자열입니다. 허용되는 단위는 "ns", "us"(또는 "µs"), "ms", "s", "m", "h"이다. 첫 번째 숫자는 "-2h5m"과 같이 음의 지속 시간을 나타내기 위해 음수일 수 있다.

결과는 또한 RFC 3339 형식의 문자열로, 주어진 방향을 주어진 타임스탬프에 추가한 결과를 나타낸다.

##### Examples

```
> timeadd("2017-11-22T00:00:00Z", "10m")
2017-11-22T00:10:00Z
```

#### timestamp Function

timestamp는 RFC 3339 형식의 UTC 타임스탬프 문자열을 반환합니다.

테라폼 언어에서 타임스탬프는 RFC 3339 "Date and Time format" 구문을 사용하는 문자열로 표현되므로 타임스탬프는 이 형식의 문자열을 반환합니다.

이 함수의 결과는 매초마다 달라지므로, 리소스 속성과 함께 이 함수를 직접 사용하면 모든 테라폼 실행에서 diff가 감지됩니다. 리소스 속성에 이 함수를 사용하는 것은 권장하지 않지만 드물게 ignore_changes lifecycle meta-argument와 함께 사용하여 리소스를 처음 생성할 때만 타임스탬프를 가져올 수 있습니다. 보다 안정적인 시간 처리에 대해서는 Time Provider를 참조하십시오.

지속적으로 변화하는 반환 값 때문에 테라폼의 계획 단계에서는 이 함수의 결과를 예측할 수 없으므로 일단 plan이 적용되어야만 타임스탬프가 찍힌다.

##### Examples

```
> timestamp()
2018-05-13T07:44:12Z
```

##### Related Functions

- formatdate는 결과 타임스탬프를 다른 날짜 및 시간 형식으로 변환할 수 있습니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/05_Filesystem_Functions/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/07_Hash_and_Crypto_Functions/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
