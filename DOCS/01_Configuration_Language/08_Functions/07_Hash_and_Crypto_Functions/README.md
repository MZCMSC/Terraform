### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [05.Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/README.md) / [07.Hash and Crypto Functions](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/07_Hash_and_Crypto_Functions/README.md)

---
### Hash and Crypto Functions

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
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/07_Hash_and_Crypto_Functions/README.md"><i><b>Hash_and_Time_Functions</b></i></a>
                ├── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/08_IP_Network_Functions/README.md">IP_Network_Functions</a>
                └── <a href ="https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/09_Type_Conversion_Functions/README.md">Type_Conversion_Functions</a>
</pre>

---

#### base64sha256 Function

base64sha256은 주어진 문자열의 SHA256 해시를 계산하고 Base64로 인코딩한다. sha256()은 16진수 표현을 반환하므로 base64encode(sha256("test"))와 같지 않습니다.

##### Examples

```
> base64sha256("hello world")
uU0nuZNNPgilLlLX2n2r+sSE7+N6U4DukIj3rOLvzek=
```

##### Related Functions

- filebase64sha256은 문자열 값이 아닌 파일의 내용에서 동일한 해시를 계산합니다.
- sha256은 동일한 해시를 계산하지만 더 많은 16진수 인코딩으로 결과를 반환합니다.

#### base64sha512 Function

base64sha512는 주어진 문자열의 SHA512 해시를 계산하여 Base64로 인코딩한다. 이것은 sha512()가 16진수 표현을 반환하기 때문에 base64encode("test")와 같지 않습니다.

주어진 문자열은 처음에 UTF-8로 인코딩된 다음 RFC 4634에 정의된 대로 SHA512 알고리즘이 적용됩니다. 원시 해시는 반환되기 전에 Base64로 인코딩된다. 테라폼은 RFC 4648 섹션 4에 정의된 "표준" Base64 알파벳을 사용한다.

##### Examples

```
> base64sha512("hello world")
MJ7MSJwS1utMxA9QyQLytNDtd+5RGnx6m808qG1M2G+YndNbxf9JlnDaNCVbRbDP2DDoH2Bdz33FVC6TrpzXbw==
```

#### ##### Related Functions

- filebase64sha512 문자열 값이 아닌 파일 내용에서 동일한 해시를 계산합니다.
- sha512는 동일한 해시를 계산하지만 더 많은 16진수 인코딩으로 결과를 반환합니다.

#### bcrypt Function

bcrypt는 Blowfish 암호를 사용하여 주어진 문자열의 해시를 계산하며, 많은 유닉스 시스템의 섀도 암호 파일에 일반적으로 예상되는 the Modular Crypt Format의 문자열을 반환한다.

```
bcrypt(string, cost)
```

cost 인수는 선택 사항이며 지정되지 않은 경우 기본값은 10입니다.

bcrypt 해시 값은 무작위로 선택된 salt를 포함하므로, 주어진 문자열과 비용이 동일하더라도 이 함수에 대한 각 호출은 다른 값을 반환합니다. 따라서 리소스 인수와 함께 이 함수를 직접 사용하면 가짜 diff가 발생합니다. 이 기능은 provisioner 블록에서만 사용하거나 결과가 provisioner 블록에서만 사용되는 데이터 리소스에서만 사용하는 것이 좋습니다.

생성된 문자열의 버전 접두사(예: $2a$)는 향후 버전의 테라폼에서 변경될 수 있다.

##### Examples

```
> bcrypt("hello world")
$2a$10$D5grTTzcsqyvAeIAnY/mYOIqliCoG7eAMX0/oFcuD.iErkksEbcAa
```

#### filebase64sha256 Function

filebase64sha256은 base64sha256의 변형으로, 리터럴 문자열이 아닌 주어진 파일의 내용을 해시한다.

이것은 base64sha256(file(filename))과 유사하지만, file이 UTF-8 텍스트만 받아들이기 때문에 이진 파일을 위한 해시를 만드는 데 사용할 수 없다.

#### filebase64sha512 Function

filebase64sha512는 base64sha512의 변형으로 리터럴 문자열이 아닌 주어진 파일의 내용을 해시한다.

이것은 base64sha512(ile(filename))과 비슷하지만, file이 UTF-8 텍스트만 받아들이기 때문에 이진 파일을 위한 해시를 만드는 데 사용할 수 없다.

#### filemd5 Function

filemd5는 리터럴 문자열이 아닌 주어진 파일의 내용을 해시하는 md5의 변형이다.

이는 md5(file(filename))와 유사하지만, file이 UTF-8 텍스트만 받아들이기 때문에 이진 파일을 위한 해시를 만드는 데 사용할 수 없다.

#### filesha1 Function

filesha1은 리터럴 문자열이 아닌 주어진 파일의 내용을 해시하는 sha1의 변형이다.

이것은 sha1(file(filename))과 비슷하지만, file이 UTF-8 텍스트만 받아들이기 때문에 이진 파일을 위한 해시를 만드는 데 사용할 수 없다.

#### filesha256 Function

filesha256은 sha256의 변형으로, 리터럴 문자열이 아닌 주어진 파일의 내용을 해시한다.

이것은 sha256(file(filename))과 유사하지만, file이 UTF-8 텍스트만 받아들이기 때문에 이진 파일을 위한 해시를 만드는 데 사용할 수 없다.

#### filesha512 Function

filesha512은 sha512의 변형으로, 리터럴 문자열이 아닌 주어진 파일의 내용을 해시한다.

이것은 sha512(file(filename))과 유사하지만, file이 UTF-8 텍스트만 받아들이기 때문에 이진 파일을 위한 해시를 만드는 데 사용할 수 없다.

#### md5 Function

md5는 주어진 문자열의 MD5 해시를 계산하고 16진수로 인코딩한다.

주어진 문자열은 먼저 UTF-8로 인코딩된 다음 RFC 1321에 정의된 대로 MD5 알고리즘이 적용됩니다. 원시 해시는 반환되기 전에 소문자 16진수로 인코딩된다.

보안에 민감한 항목에 이 기능을 사용하기 전에 MD5 알고리즘에 적용되는 업데이트된 보안 고려 사항은 RFC 6151을 참조하십시오.

##### Examples

```
> md5("hello world")
5eb63bbbe01eeed093cb22bb8f5acdc3
```

##### Related Functions

- filemd5는 문자열 값이 아닌 파일의 내용에서 동일한 해시를 계산합니다.

#### rsadecrypt Function

rsdecrypt는 RSA 암호화 암호문을 해독하여 해당 일반 텍스트를 반환합니다.

```
rsadecrypt(ciphertext, privatekey)
```

ciphertext은 PKCS #1 v1.5 패딩 방식을 사용하여 암호문(ciphertext)의 base64 인코딩 표현이어야 합니다. 테라폼은 RFC 4648 section 4에 정의된 "standard" Base64 알파벳을 사용한다.

개인 키는 자체 암호화되지 않은 PEM으로 인코딩된 RSA 개인 키여야 합니다.

테라폼에는 메시지 암호화 기능이 없습니다. 이 기능을 사용하여 out-of-band의 keypair negotation을 통해 원격 서비스에서 반환한 암호 텍스트를 해독합니다.

##### Examples

```
> rsadecrypt(filebase64("${path.module}/ciphertext"), file("privatekey.pem"))
Hello, world!
```

sha1 Function

sha1은 주어진 문자열의 SHA1 해시를 계산하고 16진수로 인코딩한다.

주어진 문자열은 먼저 UTF-8로 인코딩된 다음 RFC 3174에 정의된 대로 SHA1 알고리즘이 적용된다. 원시 해시는 반환되기 전에 소문자 16진수로 인코딩된다.

이 해싱 기능에 대해 충돌 공격이 성공적으로 수행되었습니다. 보안에 민감한 항목에 대해 이 기능을 사용하기 전에 관련 문서를 검토하여 보안 의미를 이해하십시오.

##### Examples

```
> sha1("hello world")
2aae6c35c94fcfb415dbe95f408b9ce91ee846ed
```

##### Related Functions

- filesha1은 문자열 값이 아닌 파일의 내용에서 동일한 해시를 계산합니다.

#### sha256 Function

sha256은 주어진 문자열의 SHA256 해시를 계산하고 16진수로 인코딩한다.

주어진 문자열은 먼저 UTF-8로 인코딩된 다음 RFC 4634에 정의된 대로 SHA256 알고리즘을 적용합니다. 원시 해시는 반환되기 전에 소문자 16진수로 인코딩된다.

##### Examples

```
> sha256("hello world")
b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9
```

##### Related Functions

- filesha256은 문자열 값이 아닌 파일의 내용에서 동일한 해시를 계산합니다.
- base64sha256은 동일한 해시를 계산하지만 더 치밀한 Base64 인코딩으로 결과를 반환합니다.

#### sha512 Function

sha512는 주어진 문자열의 SHA512 해시를 계산하고 16진수로 인코딩한다.

주어진 문자열은 처음에 UTF-8로 인코딩된 다음 RFC 4634에 정의된 대로 SHA512 알고리즘이 적용됩니다. 원시 해시는 반환되기 전에 소문자 16진수로 인코딩된다.

##### Examples

```
> sha512("hello world")
309ecc489c12d6eb4cc40f50c902f2b4d0ed77ee511a7c7a9bcd3ca86d4cd86f989dd35bc5ff499670da34255b45b0cfd830e81f605dcf7dc5542e93ae9cd76f
```

##### Related Functions

- filesha512는 문자열 값이 아닌 파일의 내용에서 동일한 해시를 계산합니다.
- base64sha512는 동일한 해시를 계산하지만 더 치밀한 Base64 인코딩으로 결과를 반환합니다.

#### uuid Function

uuid는 고유한 식별자 문자열을 생성합니다.

ID는 버전 4 UUID를 생성하는 RFC 4122 섹션 4.4에 따라 생성되고 포맷됩니다. 결과는 pseudo-random number에서만 생성된 UUID입니다.

이 함수는 호출될 때마다 새로운 값을 생성하므로 리소스 인수에 직접 사용하면 잘못된 diff가 발생합니다. 리소스 구성에서 uuid 함수를 사용하는 것은 권장하지 않지만 ignore_changes 수명 주기 메타 인수와 함께 주의하여 사용할 수 있습니다.

대부분의 경우 랜덤 provider를 사용하는 것이 좋습니다. 랜덤 값을 일회성 생성하면 이후 작업에서 사용할 수 있도록 테라폼 상태로 유지되기 때문입니다. 특히, random_id는 uuid 함수와 동등한 랜덤 결과를 생성할 수 있다.

##### Examples

```
> uuid()
b5ee72a3-54dd-c4b8-551c-4bdc0204cedb
```

##### Related Functions

- uuidv5 - 이름 기반 UUID를 생성합니다.

#### uuidv5 Function

uuidv5는 RFC 4122 section 4.3에 설명된 대로 이름 기반 UUID를 생성합니다. 이 UUID는 "버전 5" UUID라고도 합니다.

```
uuidv5(namespace, name)
```

uuid에 의해 생성된 pseudo-random UUIDs와 달리 name-based UUID는 네임스페이스와 이름에서 파생되며 네임스페이스와 이름이 변경되지 않은 경우 매번 동일한 UUID 값을 생성합니다.

이름 기반 UUID 네임스페이스는 그 자체로 UUID이지만 가독성을 위해 이 함수는 RFC 4122에 의해 할당된 네임스페이스의 별칭으로 일부 키워드를 받아들입니다.

| Keyword | Namespace ID                         | Name format                           |
| ------- | ------------------------------------ | ------------------------------------- |
| "dns"   | 6ba7b810-9dad-11d1-80b4-00c04fd430c8 | A fully-qualified DNS domain name.    |
| "url"   | 6ba7b811-9dad-11d1-80b4-00c04fd430c8 | Any valid URL as defined in RFC 3986. |
| "oid"   | 6ba7b812-9dad-11d1-80b4-00c04fd430c8 | An ISO/IEC object identifier          |
| "x500"  | 6ba7b814-9dad-11d1-80b4-00c04fd430c8 | X.500 Distinguished Name              |

위의 표에 포함되지 않은 다른 네임스페이스를 사용하려면 할당된 네임스페이스 ID를 일반 UUID 문자열 형식의 첫 번째 인수에 직접 전달합니다.

##### Examples

가능한 경우 네임스페이스 키워드를 사용하여 미래의 독자에게 의도를 보다 명확하게 보여 줍니다.

```
> uuidv5("dns", "www.terraform.io")
a5008fae-b28c-5ba5-96cd-82b4c53552d6
> uuidv5("url", "https://www.terraform.io/")
9db6f67c-dd95-5ea0-aa5b-e70e5c5f7cf5
> uuidv5("oid", "1.3.6.1.4")
af9d40a5-7a36-5c07-b23a-851cd99fbfa5
> uuidv5("x500", "CN=Example,C=GB")
84e09961-4aa4-57f8-95b7-03edb1073253
```

namespace 키워드는 해당 namespace UUID와 동등하게 처리되며, 특별한 경우 UUID 형식을 사용하는 것이 더 적절할 수 있습니다.

```
> uuidv5("6ba7b810-9dad-11d1-80b4-00c04fd430c8", "www.terraform.io")
a5008fae-b28c-5ba5-96cd-82b4c53552d6
```

RFC 4122 외부에서 정의된 네임스페이스를 사용하려면 해당 키워드를 사용할 수 없으므로 네임스페이스 UUID를 사용해야 합니다.

```
> uuidv5("743ac3c0-3bf7-4a5b-9e6c-59360447c757", "LIBS:diskfont.library")
ede1a974-df7e-5f17-84b9-76208818b2c8
```

원 UUID 네임스페이스를 사용할 때는 정의된 표준을 참조 하는 등 이것이 인간 중심의 방식으로 어떤 네임스페이스를 나타내는지 식과 함께 설명을 포함하는 것을 고려하십시오.

##### Related Functions

- uuid - pseudorandom UUID를 생성합니다.

---

### [이전 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/06_Date_and_Time_Functions/README.md)

### [다음 페이지](https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Functions/08_IP_Network_Functions/README.md)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
