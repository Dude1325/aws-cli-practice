#!/bin/bash

# Farben->aussagekräftiger
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}>>> Starting IAM Full Lab...${NC}"

# 1. create user
echo "--- Phase 1: Users and Groups ---"
cd iam/01-users-groups && ./user_manager.sh
cd ../.. # back2theroots

# 2. create policy
echo "--- Phase 2: Policies ---"
echo "--- create custom policy ---"
cd iam/02-policies && ./create-custom-policy.sh
cd ../.. # back2theroots

# 3. attach policy to user
echo "--- attach policy to user ---"
cd iam/02-policies && ./attach-managed-policy.sh
cd ../..

# 4. detach policy
echo "--- detach policy ---"
cd iam/02-policies && ./detach-policy.sh
cd ../..

#
#clean up the policy
cd iam/02-policies && ./cleanup-policy.sh
echo -e "${GREEN}>>> Lab Deployment Finished!${NC}"
cd ../..

