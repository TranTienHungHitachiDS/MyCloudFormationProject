#!/bin/bash
set -e 

PROFILE="personal"


# Create stacks in order
sh network/create_network_stack.sh $PROFILE "dkhp-network-stack"
sh iam/create_iam_stack.sh $PROFILE "dkhp-iam-stack"
sh rds/create_rds_stack.sh $PROFILE "dkhp-rds-stack"
sh dynamodb/create_dynamodb_stack.sh $PROFILE "dkhp-dynamodb-stack"
sh efs/create_efs_stack.sh $PROFILE "dkhp-efs-stack"
sh lambda-functions/create_lambda_stack.sh $PROFILE "dkhp-lambda-stack"
sh load-balancer/create_lb_stack.sh $PROFILE "dkhp-lb-stack"
sh ecs-task-definitions/create_ecs_tf_stack.sh $PROFILE "dkhp-ecs-tf-stack"
sh ecs/create_ecs_stack.sh $PROFILE "dkhp-ecs-stack"


echo "Created all stack successfully"
exit 0
