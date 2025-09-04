#!/bin/bash
set -e 

# Create stacks in order
sh network/create_network_stack.sh
sh iam/create_iam_stack.sh
sh rds/create_rds_stack.sh

echo "Created all stack successfully"
exit 0
