#!/bin/bash

#create variables for user & group
USER_NAME='practice-dev-user-1'
GROUP_NAME='practice-dev-group-1'


echo "=== Creating IAM Ressources ===" 
#list users:
#aws iam list-users

#list iam users names as text
#--query 'Users[*].UserName' - returns an array with names of users
#--output text - returns a line with usernames as text
#aws iam list-users --query 'Users[*].UserName' --output text


#create aws user if doesn't exists, name = practice-dev-user-1
if aws iam create-user --user-name 'practice-dev-user-1' >2/dev/null; then
	echo "user with this name already exists"
else 
	echo "createing user USER_NAME ..."
	aws iam create-user --user-name USER_NAME
fi


#check if user created -> list users
aws iam list-users --query 'Users[*].UserName' --output text

#create group, name = practice-dev-group-1
aws iam create-group --group-name 'practice-dev-group-1'

#check -> list groupnames
aws iam list-groups --query 'Groups[*].GroupName' --output text

