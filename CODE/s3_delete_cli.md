
## AWS S3 Bucket list
```sh
aws s3 ls | grep terraform-state-backend
```

## AWS S3 Bucket (Object & Folder) list
#### 파일 확인
```sh
aws s3 ls {s3_bucket_name} --recursive --human-readable --summarize

aws s3 ls test-terraform-state-backend-msc --recursive --human-readable --summarize
```
#### 버전 파일 확인
```sh
aws s3api list-object-versions --bucket {s3_bucket_name}

aws s3api list-object-versions --bucket test-terraform-state-backend-msc
```

#### 파일 삭제
```sh
aws s3 rm s3://{s3_bucket_name}/ --recursive --include "*.*"

aws s3 rm s3://test-terraform-state-backend-msc/ --recursive --include "*.*"
```
#### versioning 파일 삭제
##### versions
```sh
aws s3api delete-objects --bucket {s3_bucket_name} --delete "$(aws s3api list-object-versions --bucket {s3_bucket_name} | jq '{Objects: [.Versions[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"

aws s3api delete-objects --bucket test-terraform-state-backend-msc --delete "$(aws s3api list-object-versions --bucket test-terraform-state-backend-msc | jq '{Objects: [.Versions[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
```

##### markets
```sh
aws s3api delete-objects --bucket test-terraform-state-backend-msc --delete "$(aws s3api list-object-versions --bucket test-terraform-state-backend-msc | jq '{Objects: [.DeleteMarkers[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"

aws s3api delete-objects --bucket {s3_bucket_name} --delete "$(aws s3api list-object-versions --bucket {s3_bucket_name} | jq '{Objects: [.DeleteMarkers[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
```


## AWS S3 bucket delete
```sh
aws s3 rb s3://{s3_bucket_name}

aws s3 rb s3://test-terraform-state-backend-msc
```



```sh
#!/bin/bash

# aws s3 list 조회
# aws s3 bucket 대상 확인 
# bucket 값 입력 ~> 변수 입력값으로 
# 삭제 진행 여부 Y/N 선택 입력!
# 삭제 진행 하도록 작성 예정.~~~~~ 

# For 문으로 돌려서 versions / markets 처리...


BUCKET_NAME="test-terraform-state-backend-msc"


aws s3 rm s3://${BUCKET_NAME}/ --recursive --include "*.*"

aws s3api delete-objects --bucket ${BUCKET_NAME} --delete "$(aws s3api list-object-versions --bucket ${BUCKET_NAME} --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"

aws s3api delete-objects --bucket ${BUCKET_NAME} --delete "$(aws s3api list-object-versions --bucket ${BUCKET_NAME} --query='{Objects: DeleteMarkers[].{Key:Key,VersionId:VersionId}}')"

aws s3 rb s3://${BUCKET_NAME}
```
