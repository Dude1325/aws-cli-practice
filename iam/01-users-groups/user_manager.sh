#!/bin/bash
#set -ex
set -e

source ./colors.sh

#create variables for user & group
if ! source ./users.cfg 2>/dev/null; then
	echo "ERROR: file 'users.cfg' not found! Aborting."
	exit 1 #script is aborting
fi


log_info "=== Creating IAM Ressources ==="
log_info "working with user: "${USER_NAME}""
log_info "working with group: "${USER_GROUP}""
echo


#create aws user if doesn't exists, take name from users.cfg
if aws iam create-user --user-name "${USER_NAME}" 2>/dev/null; then
	log_ok "SUCCESS:user ${USER_NAME} has been created"
else 
	log_info "INFO: user ${USER_NAME} already exists"
fi

:<< 'TODO'
error from terminal (15.02.2026)
+ aws iam create-group --group-name practice-dev-group-1

An error occurred (EntityAlreadyExists) when calling the CreateGroup operation: Group with name practice-dev-group-1 already exists


need to add check for existing group
TODO

#create aws group if doesn't exists, take name from users.cfg
if aws iam create-group --group-name "${USER_GROUP}" 2>/dev/null; then
       log_ok "group ${USER_GROUP} has been created"
else
 	log_info "group ${USER_GROUP} already exists"
fi
echo 


log_info  "=== add user to group ==="
log_info "no need to check, if user is already in group. add-user-to-group works idempotent"
log_info "add user:"${USER_NAME}" to group:"${USER_GROUP}""
aws iam add-user-to-group --user-name "${USER_NAME}" --group-name "${USER_GROUP}"
echo





