#!/bin/bash
set -e 

PROFILE="personal"


# Create stacks in order
sh network/create_network_stack.sh $PROFILE "mdms-network-stack"
sh iam/create_iam_stack.sh $PROFILE "mdms-iam-stack"
sh rds/create_rds_stack.sh $PROFILE "mdms-rds-stack"
# sh dynamodb/create_dynamodb_stack.sh $PROFILE "mdms-dynamodb-stack"
sh rds/create_rds_stack.sh $PROFILE "mdms-rds-stack"
sh efs/create_efs_stack.sh $PROFILE "mdms-efs-stack"
# sh lambda-functions/create_lambda_stack.sh $PROFILE "mdms-lambda-stack"
sh load-balancer/create_lb_stack.sh $PROFILE "mdms-lb-stack"
sh ecs-task-definitions/create_ecs_tf_stack.sh $PROFILE "mdms-ecs-tf-stack"
sh ecs/create_ecs_stack.sh $PROFILE "mdms-ecs-stack"


echo "Created all stack successfully"
exit 0
