
## AWS S3 Bucket list
aws s3 ls | grep terraform-state-backend

## AWS S3 Bucket (Object & Folder) list
#### 파일 확인
```sh
aws s3 ls test-terraform-state-backend-ygcho --recursive --human-readable --summarize
```
#### 버전 파일 확인
```sh
aws s3api list-object-versions --bucket test-terraform-state-backend-ygcho
```

#### 파일 삭제
```sh
aws s3 rm s3://test-terraform-state-backend-ygcho/* --recursive --include "*.*"
```
#### versioning 파일 삭제
##### versions
```sh
aws s3api delete-objects --bucket test-terraform-state-backend-ygcho --delete "$(aws s3api list-object-versions --bucket test-terraform-state-backend-ygcho | jq '{Objects: [.Versions[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
```

##### markets
```sh
aws s3api delete-objects --bucket test-terraform-state-backend-ygcho --delete "$(aws s3api list-object-versions --bucket test-terraform-state-backend-ygcho | jq '{Objects: [.DeleteMarkers[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
```


## AWS S3 bucket delete
```sh
aws s3 rb s3://test-terraform-state-backend-ygcho
```



```sh
#!/bin/bash

# aws s3 list 조회
# aws s3 bucket 대상 확인 
# bucket 값 입력 ~> 변수 입력값으로 
# 삭제 진행 여부 Y/N 선택 입력!
# 삭제 진행 하도록 작성 예정.~~~~~ 

# For 문으로 돌려서 versions / markets 처리...


BUCKET_NAME="test-terraform-state-backend-ygcho"

aws s3 rm s3://${BUCKET_NAME}/* --recursive --include "*.*"

aws s3api delete-objects --bucket ${BUCKET_NAME} --delete "$(aws s3api list-object-versions --bucket ${BUCKET_NAME} --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"

aws s3api delete-objects --bucket ${BUCKET_NAME} --delete "$(aws s3api list-object-versions --bucket ${BUCKET_NAME} --query='{Objects: DeleteMarkers[].{Key:Key,VersionId:VersionId}}')"

aws s3 rb s3://${BUCKET_NAME}
```