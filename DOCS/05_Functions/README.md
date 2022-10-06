### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [08.Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md)

---

#### DOCS TREE

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
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md"><i><b>Functions</b></i></a>
</pre>

---

## 08. Functions

### Built-in Functions

> 테라폼 언어에는 식 내에서 호출하여 값을 변환하고 결합할 수 있는 여러 가지 내장 함수가 포함되어 있습니다. 함수 호출의 일반 구문은 함수 이름 뒤에 괄호 안의 쉼표로 구분된 인수가 뒤따른다.

```
max(5, 12, 9)
```

> 테라폼 언어는 사용자 정의 함수를 지원하지 않으므로 언어에 내장된 기능만 사용할 수 있습니다. 이 섹션의 탐색에는 사용 가능한 모든 내장 기능의 목록이 포함되어 있습니다.

> terraform console 명령을 실행하여 Terraform 표현 콘솔에서 Terraform의 내장 함수의 동작을 실험할 수 있습니다.

```
> max(5, 12, 9)
12
```

> 각 기능에 대한 설명서의 예제에서는 콘솔 출력을 사용하여 매개 변수가 서로 다른 함수를 호출한 결과를 설명합니다.

- [Numeric Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/01_Numeric_Functions/README.md)
- [String Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/02_String_Functions/README.md)
- [Collections Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/03_Collection_Functions/README.md)
- [Encoding Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/04_Encoding_Functions/README.md)
- [Filesystem Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/05_Filesystem_Functions/README.md)
- [Date and Time Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/06_Date_and_Time_Functions/README.md)
- [Hash and Crypto Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/07_Hash_and_Crypto_Functions/README.md)
- [IP Network Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/08_IP_Network_Functions/README.md)
- [Type Conversion Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/09_Type_Conversion_Functions/README.md)
