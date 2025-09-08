# How to push image to ECR Repo

## 1. Authenticate docker to ECR
```bash
aws ecr get-login-password --region <region> --profile <profile> \
  | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
```

## 2.  Build your docker image
```bash
cd ./my-lambda-app
docker build -t my-lambda-app .
```

## 3.  Tag the image to ECR
```bash
docker tag my-lambda-app <account-id>.dkr.ecr.<region>.amazonaws.com/mdms-dev/my-lambda-app
```

## 4.  Push to the ECR Repo
```bash
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/mdms-dev/my-lambda-app
```

