# Mini Cloud Formation Project
## Steps to deploy the project

### 1. Validate the Template
```bash
aws cloudformation validate-template --template-body file://templates/main.yaml
```

### 2. Create an s3 bucket to store templates
```bash
aws s3api create-bucket --bucket cloudformation-antifact-bucket  --region us-east-1
```


### 2. Package the Template to S3
```bash
aws cloudformation package --template-file templates/main.yaml --s3-bucket cloudformation-antifact-bucket --output-template-file packaged-main.yaml
```

### 4. Create the first Change Set
```bash
aws cloudformation create-change-set --stack-name MyStack --template-body file://templates/main.yaml --change-set-name ChangeSet1 --parameters ParameterKey=Env,ParameterValue=dev --capabilities CAPABILITY_NAMED_IAM --change-set-type CREATE
```

### 5. Describe Change Set
```bash
aws cloudformation describe-change-set --stack-name MyStack --change-set-name ChangeSet1
```

### 6. Execute Change Set
```bash
aws cloudformation execute-change-set --stack-name MyStack --change-set-name ChangeSet1
```

### 7. Or you can deploy the template directly instead of runnign steps 4,5,6
```bash
aws cloudformation deploy --template-file packaged-main.yaml --stack-name MyStack --parameter-overrides Env=dev --capabilities CAPABILITY_NAMED_IAM
```