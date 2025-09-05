#!/bin/bash

PROFILE="personal"

delete_stack_if_exists() {
    local stack_name=$1

    if aws cloudformation describe-stacks --stack-name "$stack_name" >/dev/null 2>&1; then
        echo "Deleting stack: $stack_name"
        aws cloudformation delete-stack --stack-name "$stack_name"
        
        aws cloudformation wait stack-update-complete --profile "$PROFILE" --stack-name "$stack_name"
        echo "Deleted stack $stack_name successfully"
    else
        echo "Stack $stack_name does not exist, skipping."
    fi
}

# Delete stacks in order
delete_stack_if_exists "mdms-dynamodb-stack"
delete_stack_if_exists "mdms-rds-stack"
delete_stack_if_exists "mdms-iam-stack"
delete_stack_if_exists "mdms-network-stack"

echo "Deleted all stack successfully"
exit 0