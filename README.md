## Commands

### 1. Validate the Template
aws cloudformation validate-template --template-body file://templates/main.yaml

### 2. Package the Template to S3
aws cloudformation package --template-file templates/main.yaml --s3-bucket cloudformation-antifact-bucket --output-template-file packaged-main.yaml

### 3. Deploy the Template
aws cloudformation deploy --template-file packaged-main.yaml --stack-name my-first-stack --parameter-overrides Env=dev