### Numeric Functions

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md">Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/01_Numeric_Functions/README.md"><i><b>Numeric_Functions</b></i></a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/02_String_Functions/README.md">String_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/03_Collection_Functions/README.md">Collection_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/04_Encoding_Functions/README.md">Encoding_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/05_Filesystem_Functions/README.md">Filesystem_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/06_Date_and_Time_Functions/README.md">Date_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/07_Hash_and_Crypto_Functions/README.md">Hash_and_Time_Functions</a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/08_IP_Network_Functions/README.md">IP_Network_Functions</a>
                └── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/09_Type_Conversion_Functions/README.md">Type_Conversion_Functions</a>
</pre>

---

#### abs Fuction

abs는 지정된 숫자의 절대값을 반환합니다. 즉, 숫자가 0이거나 양수이면 있는 그대로 반환되지만 음수이면 -1에 곱하여 양수로 만든 후 반환한다.

##### Example

```
> abs(23)
23
> abs(0)
0
> abs(-12.4)
12.4
```

#### ceil Function

ceil은 지정된 값보다 크거나 같은 가장 가까운 정수를 반환합니다.

##### Example

```
> ceil(5)
5
> ceil(5.1)
6
```

##### Related Functions

- floor는 최소 또는 동일한 가장 가까운 정수로 반올림합니다.

#### floor Function

floor는 지정된 값보다 작거나 같은 가장 가까운 정수를 반환합니다.

##### Example

```
> floor(5)
5
> floor(4.9)
4
```

##### Related Functions

- ceil, 이 값은 더 크거나 같은 가장 가까운 정수로 반올림합니다.

#### log Function

log는 지정된 base에 있는 지정된 숫자의 로그를 반환합니다.

```
log(number, base)
```

##### Examples

```
> log(50, 10)
1.6989700043360185
> log(16, 2)
4
```

log와 ceil은 주어진 수의 고유 값을 나타내는 데 필요한 이진수의 최소 수를 찾기 위해 함께 사용될 수 있다.

```
> ceil(log(15, 2))
4
> ceil(log(16, 2))
4
> ceil(log(17, 2))
5
```

#### max Function

max는 하나 이상의 숫자를 사용하고 집합에서 가장 큰 숫자를 반환합니다.

##### Examples

```
> max(12, 54, 3)
54
```

숫자가 목록 또는 설정 값에 있는 경우 ...을 사용하여 컬렉션을 개별 인수로 확장합니다.

```
> max([12, 54, 3]...)
54
```

##### Related Functions

- min은 집합에서 가장 작은 숫자를 반환합니다.

#### min Function

min은 하나 이상의 숫자를 사용하고 집합에서 가장 작은 숫자를 반환합니다.

##### Examples

```
> min(12, 54, 3)
3
```

숫자가 목록 또는 설정 값에 있는 경우 ...을 사용하여 컬렉션을 개별 인수로 확장합니다.

```
> min([12, 54, 3]...)
3
```

##### Related Functions

- max. 집합에서 가장 큰 수를 반환합니다.

#### parseint Function

parseint는 지정된 문자열을 지정된 base에 있는 정수의 표현으로 구문 분석하고 결과 숫자를 반환합니다. base는 2와 62 사이여야 합니다.

모든 받침대는 아라비아 숫자 0부터 9까지 먼저 사용한다. 11에서 36 사이의 base는 대소문자를 구분하지 않는 라틴 문자를 사용하여 더 높은 단위 값을 나타냅니다. 37자리 이상은 소문자 라틴 문자와 대문자 라틴 문자를 사용한다.

주어진 문자열에 주어진 기본에 비해 너무 큰 비숫자 또는 숫자 문자가 포함된 경우 parseint는 오류를 생성합니다.

##### Example

```
> parseint("100", 10)
100
> parseint("FF", 16)
255
> parseint("-10", 16)
-16
> parseint("1011111011101111", 2)
48879
> parseint("aA", 62)
656
> parseint("12", 2)
Error: Invalid function argument
Invalid value for "number" parameter: cannot parse "12" as a base 2 integer.
```

##### Related Functions

- format은 숫자 및 기타 값을 문자열로 포맷할 수 있으며 선택 사항인 zero padding, alignment(정렬) 등을 사용할 수 있습니다.

#### signum Function

signum은 숫자의 부호를 결정하며 -1에서 1 사이의 숫자를 반환하여 부호를 나타냅니다.

##### Examples

```
> signum(-13)
-1
> signum(0)
0
> signum(344)
1
```

---

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/02_String_Functions/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
