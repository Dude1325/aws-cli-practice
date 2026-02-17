#!/bin/bash

# Цвета для красоты (можешь подтянуть свои)
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}>>> Starting IAM Full Lab...${NC}"

# 1. Запускаем создание пользователей
echo "--- Phase 1: Users and Groups ---"
cd iam/01-users-groups && ./user_manager.sh
cd ../.. # Возвращаемся в корень

# 2. Запускаем создание политик
echo "--- Phase 2: Policies ---"
cd iam/02-policies && ./create-custom-policy.sh
cd ../..

cd iam/02-policies && ./cleanup-policy.sh
echo -e "${GREEN}>>> Lab Deployment Finished!${NC}"

