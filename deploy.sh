#!/bin/bash
set -e 

PROFILE="personal"
NETWORK_STACK="mdms-network-stack"
IAM_STACK="mdms-iam-stack"
RDS_STACK="mdms-rds-stack"
DYNAMODB_STACK="mdms-dynamodb-stack"
ECR_STACK="mdms-ecr-stack"
LAMBDA_STACK="mdms-lambda-stack"

# Create stacks in order
sh network/create_network_stack.sh $PROFILE $NETWORK_STACK
sh iam/create_iam_stack.sh $PROFILE $IAM_STACK
sh rds/create_rds_stack.sh $PROFILE $RDS_STACK
sh dynamodb/create_dynamodb_stack.sh $PROFILE $DYNAMODB_STACK
sh ecr/create_ecr_stack.sh $PROFILE $LAMBDA_STACK
sh lambda-functions/create_lambda_stack.sh $PROFILE $LAMBDA_STACK

echo "Created all stack successfully"
exit 0
