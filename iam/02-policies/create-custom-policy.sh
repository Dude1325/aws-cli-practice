#! /bin/bash
#set -e
#set -ex
#
source ./colors.sh
#colors...
#greeting
#get variables from .cfg
#upload it from file
#validate policy
#create policy from file
#get ARN from policy -> attach.sh should work with it, it's id of my policy?
#
if source ./policies.cfg 2>/dev/null; then
	log_info "read the policies.cfg"
	log_info "policy name: ${POLICY_NAME}"
	log_info "policy file: ${POLICY_FILE}"
else
	log_err "unable to find policies.cfg! Aborting."
fi
ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
POLICY_ARN="arn:aws:iam::$ACCOUNT_ID:policy/$POLICY_NAME"


log_info "validate policy ${POLICY_NAME}"

VALIDATION_RESULT=$(aws accessanalyzer validate-policy --policy-document file://policy.json --policy-type IDENTITY_POLICY)

log_info "validation result: ${VALIDATION_RESULT}"

if [[ $VALIDATION_RESULT == *"ERROR"*  ]]; then
	log_err "ERROR: JSON logic is brocken! Aborting."
	exit 1
	
else
	log_ok "validation is passed"
fi

log_info "create policy from json"
log_info "you have to check, if policy with this name already exists"
aws iam get-policy --policy-arn "${POLICY_ARN}" 2>/dev/null

if [[ $? -eq "0" ]]; then
	log_info "policy already exists"
else
	log_info "create policy"
	aws iam create-policy \
		--policy-name "${POLICY_NAME}" \
		--policy-document "file://${POLICY_FILE}" \
		--description "Allows S3 buckets for practice lab"
fi



#you have to use here the $?, if you try to do the construct below and you get error, this error will not be piped to $CREATEION_RESULT
#it will be thrown directly to terminal
#CREATEION_RESULT=$(aws iam create-policy \
#    --policy-name "${POLICY_NAME}" \
#    --policy-document "file://${POLICY_FILE}" \
#    --description "Allows S3 list buckets for practice lab")
#
#if [[ $CREATEION_RESULT == "*error*"]]; then
#       log_err "policy creation failed"
#else
# log_ok "policy created"
#fi 
#log_info "creation result: ${CREATION_RESULT}"

echo "$POLICY_ARN" > .current_policy_arn
echo ".current_policy_arn" >> .gitignore
