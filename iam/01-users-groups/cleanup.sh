#!/bin/bash
#
#my cleanup script
#
#

set -e
source ./colors.sh

#check if users.cfg exists, if not -> aborting script
if ! source ./users.cfg 2>/dev/null; then
	echo "ERROR: file 'user.cfg' is not found! Aborting."
	exit 1 #script is aborting
fi

log_info "=== remove user from group ==="
log_info "no need to check, if user is already removed from the group, it works idemppotent"
log_info "remove user: "${USER_NAME}" from group:"${USER_GROUP}""
aws iam remove-user-from-group --user-name "${USER_NAME}" --group-name "${USER_GROUP}"
echo

log_info "=== remove user from group ==="
log_info "no need to check, if user is already removed from the group, it works idemppotent"
log_info "remove user: "${USER_NAME}" from group:"${USER_GROUP}""
aws iam remove-user-from-group --user-name "${USER_NAME}" --group-name "${USER_GROUP}"
echo


log_info "=== delete user and group ==="
log_info "step 1: delete user, here i need to check, if user exists. Delete-operation is not idempotent"
if aws iam delete-user --user-name "${USER_NAME}" 2>/dev/null; then
        log_ok "${USER_NAME} has been deleted"
else
        log_err "${USER_NAME} is not exists"
fi
echo

log_info "step 2: delete group, also need to check, if group exists, but also, if it's not empty"
if aws iam get-group --group-name "${USER_GROUP}" 2>/dev/null; then
        USERS_IN_GROUP=$(aws iam get-group --group-name "${USER_GROUP}" --query 'Users[*].UserName' --output text)
        if [ -z "$USERS_IN_GROUP" ]; then
                aws iam delete-group --group-name "${USER_GROUP}"
                log_ok "group ${USER_GROUP} has been deleted"
        else
                log_err "group is not empty, remove users first"
        fi
else
        log_info "group ${USER_GROUP} is not exists"
fi
