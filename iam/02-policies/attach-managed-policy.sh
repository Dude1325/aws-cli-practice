source colors.sh
log_info "attch-managed-policy.sh"
log_info "do later: minimal check if user, policiy and so on exist."
log_info "actually it's responcibility of parent script like shell-run.sh, to check on the rigth place or to abort, if smt.fail"

if source ../../users.cfg 2>/dev/null; then 
	log_info "work with user: ${USER_NAME}"
	log_info "work with group: ${USER_GROUP}"
	
else
	log_err "ERROR: config file not found! Aborting."
	exit 1
fi


log_info "next step: get the arn number & attach it to user"
log_info "check if the temporary file is there and if its not empty"
if [[ -s ".current_policy_arn" ]]; then
	log_info "Validation successfull"
else
	log_err "file is not found or empty! Aborting."
	exit 1
fi

ARN=$(cat .current_policy_arn)
log_info "policy-arn: ${ARN}"



#attach policy to user and get execution status code
aws iam attach-user-policy --user-name "${USER_NAME}" --policy-arn "${ARN}" 2>/dev/null
EXIT_CODE=$?
log_info "exit code: ${EXIT_CODE}, but later comment it out."
if [[ $EXIT_CODE -eq 0 ]] ; then
       log_ok "policy with arn: ${ARN} is attached to user: ${USER_NAME}. Finalize."
else 
	log_err "ERROR:failed to attach policy"
fi

