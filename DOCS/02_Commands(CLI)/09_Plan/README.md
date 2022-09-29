### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md) / [DOCS](https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md) / [02.Commands(CLI)](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md>) / [09.Plan](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_Plan/README.md>)

---

#### DOCS TREE

<pre>
<a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/README.md">DOCS</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/00_Terraform/README.md">Terraform</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/01_Configuration_Language/README.md">Configuration Language</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/README.md">Commands(CLI)</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/01_Environment_Variables/README.md">Environment_Variables</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/02_Apply/README.md">Apply</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/03_Destroy/README.md">Destroy</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/04_FMT/README.md">FMT</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/05_Graph/README.md">Graph</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/06_Import/README.md">Import</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/07_Init/README.md">Init</a>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Output/README.md">Output</a>
    │               ├── <i><b><a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/09_Plan/README.md">Plan</a></b></i>
    │               ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Providers/README.md">Providers</a>
    │               └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/11_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/03_Providers/README.md">Providers</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/04_Provisioners/README.md">Provisioners</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/05_Modules/README.md">Modules</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/06_State/README.md">State</a>
    ├── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/07_Backends/README.md">Backends</a>
    └── <a href = "https://github.com/MZCMSC/Terraform/blob/main/DOCS/08_Functions/README.md">Functions</a>

</pre>

### Plan

> terraform plan 명령은 실행 계획을 작성하는데 사용됩니다. Terraform은 명시적으로 비활성화되지 않은 경우 새로 고침을 수행한 다음 구성 파일에 지정된 원하는 상태를 달성하는데 필요한 작업을 결정합니다.

> 이 명령은 실제 자원이나 상태를 변경하지 않고 일련의 변경에 대한 실행 계획이 예상과 일치하는지 확인하는 편리한 방법입니다.

#### Usage

```
Terraform plan [option] [dir]
```

#### Options

> -destroy  
> 설정된 경우 알려진 모든 자원을 삭제하는 계획을 생성합니다.

> -input=true  
> 직접 설정되지 않은 경 변수 입력을 요청합니다.

> -target=resource  
> 타게팅할 리소스 주소입니다. 이 플래그는 여러 번 사용할 수 있습니다. 자세한 내용은 아래를 참조하십시오.

> -var 'foo=bar'  
> Terraform 구성에서 변수를 설정합니다.

> -var-file=foo  
> Terraform 구성의 변수를 변수 파일에서 설정합니다. Terraform.tfvars 또는 .auto.tfvars 파일이 현재 디렉토리에 있으면 자동으로 로드됩니다. 이 플래그는 여러 번 사용할 수 있습니다.

#### Resource Targeting

> -target 옵션을 사용하려면 리소스의 하위 집합에만 Terraform의 주의를 집중시킬 수 있습니다. 자원 주소 구문은 제한 조건을 지정하는데 사용됩니다. 이 타겟팅 기능은 실수 복구 또는 Terraform 제한 문제 해결과 같은 예외적인 상황을 위해 제공됩니다. 일상적인 작업에는 -target을 사용하지 않는것이 좋습니다. 이로 인해 구성 드리프트가 감지되지 않고 실제 자원 상태가 구성과 어떻게 관련 되는지 혼동될 수 있습니다.

#### Option

##### Plan Customization Options

다음 옵션은 Terraform이 계획을 생성하는 방법을 사용자 정의합니다. 또한 단일 명령으로 계획하고 적용하기 위해 저장된 계획을 전달하지 않고 "terraform apply"를 실행할 때 이러한 옵션을 사용할 수 있습니다.

> -destroy  
> 일반적인 동작 대신 이 Terraform 구성으로 현재 관리되는 모든 개체를 destroy하는 계획을 만드는 "destroy" 계획 모드를 선택합니다.

> -refresh-only  
> 원격 개체가 가장 최근의 Terraform 적용 결과와 여전히 일치하는지 확인하는 "refresh only" 계획 모드를 선택합니다. 그러나 Terraform 외부에서 변경한 내용을 실행 취소하는 작업은 제안하지 않습니다.

> -refresh=false  
> 계획을 만드는 동안 원격 개체에 대한 외부 변경 사항 확인을 건너뜁니다. 이렇게 하면 계획 속도가 빨라질 수 있지만, 원격 시스템 상태의 오래된 레코드에 대한 계획을 수립하는 데 비용이 들 수 있습니다.

> -replace=resource  
> 해당 리소스 주소를 사용하여 특정 리소스 인스턴스를 강제로 교체합니다. 계획이 정상적으로 이 경우에 대한 업데이트 또는 작업 금지 조치를 생성했다면 테라폼은 대신 이 작업을 대체할 계획입니다. 이 옵션을 여러 번 사용하여 둘 이상의 개체를 바꿀 수 있습니다.

> -target=resource  
> 계획 작업을 지정된 모듈, 리소스 또는 리소스 인스턴스와 해당 인스턴스의 모든 종속성으로 제한합니다. 이 옵션을 여러 번 사용하여 둘 이상의 개체를 포함할 수 있습니다. 이것은 예외적인 용도로만 사용됩니다.

> -var 'foo=bar'  
> 구성의 루트 모듈에서 입력 변수 중 하나에 대한 값을 설정합니다. 변수를 두 개 이상 설정하려면 이 옵션을 두 번 이상 사용하십시오.

> -var-file=filename  
> 기본 파일 terraform.tfvars 및 \*.auto.tfvars와 함께 지정된 파일에서 변수 값을 로드합니다. 변수 파일을 두 개 이상 포함하려면 이 옵션을 두 번 이상 사용하십시오.

##### Other Options

> -compact-warnings Terraform이 오류를 동반하지 않는 경고를 생성하는 경우 에서는 요약 메시지만 포함하는 보다 간결한 형태로 경고를 표시합니다.

> -detailed-exitcode 명령이 종료되면 자세한 종료 코드를 반환합니다. 종료 코드의 의미가 다음과 같이 변경됩니다.

                      0 - 성공, diff가 비어 있음.(변경사항 없음)
                      1 - 오류
                      2 - 성공, diff가 있음.

> -input=true 직접 설정되지 않은 경우 변수에 대한 입력을 요청합니다.

> -lock=false 작업 중에는 상태 잠금을 유지하지 마십시오. 다른 사용자가 동일한 작업 영역에 대해 명령을 동시에 실행할 수 있는 경우 이 문제가 발생할 수 있습니다.

> -lock-timeout=0s 상태 잠금을 재시도하는 기간입니다.

> -no-color 지정한 경우 출력에 색상이 포함되지 않습니다.

> -out=path 지정된 경로에 계획 파일을 작성합니다. "apply" 명령 입력으로 사용할 수 있습니다.

> -parallelism=n 동시 작업 수를 제한합니다. 기본값은 10입니다.

> -state=statefile 로컬 백엔드에만 사용되는 레거시 옵션입니다. 자세한 내용은 로컬 백엔드의 설명서를 참조하십시오.

---

### [이전 페이지](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/08_Output/README.md>)

### [다음 페이지](<https://github.com/MZCMSC/Terraform/blob/main/DOCS/02_Commands(CLI)/10_Providers/README.md>)

### [HOME](https://github.com/MZCMSC/Terraform/blob/main/README.md)
