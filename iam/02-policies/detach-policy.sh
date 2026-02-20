#! /bin/bash
set -e
#set -ex
#
source ./colors.sh

if source ../../users.cfg 2>/dev/null; then
	log_info "work with user: ${USER_NAME}"
else
		log_error "ERROR: file users.cfg not found! Aborting."
fi


#detach policy
#take user from cfg
#group from cfg
#policy arn from file on disk
#check if user has this policy (with this arn)
#detach if yes, else just inform
#

log_info "start detach policy"
log_info "read username from cfg file"
log_info "read policy-arn from file"
log_info "check, if user has this policy attached (idempotency)"
log_info "detach if yes, else just inform"

ARN_POLICY=$(cat .current_policy_arn)
log_info "policy-arn: ${ARN_POLICY}"

#check it policy attached to user, save output & check it the output is empty
log_info "you have to check, if policy attached, detach is not an idempodent operation"
RESULT=$(aws iam list-attached-user-policies --user-name "${USER_NAME}" --query "AttachedPolicies[?PolicyArn=='$ARN_POLICY'].PolicyArn" --output text)

if [ -z "$RESULT" ]; then
	log_err "policy is not attached"
	log_err "detachment is not possible"
else 
	log_info "policy is attached"
	log_info "detach policy"
	aws iam detach-user-policy --user-name "${USER_NAME}" --policy-arn "${ARN_POLICY}"
fi




