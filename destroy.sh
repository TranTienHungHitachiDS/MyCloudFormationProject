#!/bin/bash
set -e 

PROFILE="personal"

delete_stack_if_exists() {
    local stack_name=$1

    if aws cloudformation describe-stacks --profile "$PROFILE" --stack-name "$stack_name" >/dev/null 2>&1; then
        echo "Deleting stack: $stack_name"
        aws cloudformation delete-stack --profile "$PROFILE" --stack-name "$stack_name"
        
        aws cloudformation wait stack-delete-complete --profile "$PROFILE" --stack-name "$stack_name"
        echo "Deleted stack $stack_name successfully"
    else
        echo "Stack $stack_name does not exist, skipping."
    fi
}

# Delete stacks in order
delete_stack_if_exists "dkhp-ecs-stack"
delete_stack_if_exists "dkhp-ecs-tf-stack"
delete_stack_if_exists "dkhp-lb-stack"
delete_stack_if_exists "dkhp-lambda-stack"
delete_stack_if_exists "dkhp-ecr-stack"
delete_stack_if_exists "dkhp-efs-stack"
delete_stack_if_exists "dkhp-dynamodb-stack"
delete_stack_if_exists "dkhp-rds-stack"
delete_stack_if_exists "dkhp-iam-stack"
delete_stack_if_exists "dkhp-network-stack"

echo "Deleted all stack successfully"
exit 0