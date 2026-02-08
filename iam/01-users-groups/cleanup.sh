#!/bin/bash
#
#my cleanup script
#
#
if ! source ./users.cfg 2>/dev/null; then
	echo "ERROR: file 'user.cfg' is not found! Aborting."
	exit 1 #script is aborting
fi

echo "working with user ${USER_NAME}"
if aws iam get-user --user-name "${USER_NAME}" 2>/dev/null; then
	echo "deleting user ${USER_NAME}"
	aws iam delete-user --user-name "${USER_NAME}"
else
	echo "user $USER_NAME doesn't exists"
fi




