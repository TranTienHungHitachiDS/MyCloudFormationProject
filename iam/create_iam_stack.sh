#!/bin/bash

set -e
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

STACK_NAME="mdms-iam-stack"
PROFILE="personal"
TEMPLATE_FILE="./template.yaml"
PARAMETER_FILE="./parameters/common.json"


# Check if the stack exists
if aws cloudformation describe-stacks --stack-name "$STACK_NAME" --profile "$PROFILE" --output text >/dev/null 2>&1; then
    echo "Stack $STACK_NAME exists. Updating..."
    if ! aws cloudformation update-stack \
        --stack-name "$STACK_NAME" \
        --template-body file://"$TEMPLATE_FILE" \
        --profile "$PROFILE" \
        --parameters file://"$PARAMETER_FILE" \
        --capabilities CAPABILITY_NAMED_IAM; then
        echo "Failed to update stack $STACK_NAME"
        exit 1
    fi

    aws cloudformation wait stack-update-complete --profile "$PROFILE" --stack-name "$STACK_NAME"
else
    echo "Stack $STACK_NAME does not exist. Creating..."
    if ! aws cloudformation create-stack \
        --stack-name "$STACK_NAME" \
        --template-body file://"$TEMPLATE_FILE" \
        --profile "$PROFILE" \
        --parameters file://"$PARAMETER_FILE" \
        --capabilities CAPABILITY_NAMED_IAM; then
        echo "Failed to create stack $STACK_NAME"
        exit 1
    fi

    aws cloudformation wait stack-create-complete --profile "$PROFILE" --stack-name "$STACK_NAME"
fi

echo "Stack $STACK_NAME deployed successfully"
exit 0