{
    "Version": "2012-10-17", # this line just should be always there
    "Statement": [ # begin of new dict. descrebe here everything
        {
            "Sid": "AllowS3ListOnly",   #like name/description for the dict
            "Effect": "Allow",          # allow/deny?
            "Action": [                 # with what i can work?
                "s3:ListAllMyBuckets",
                "s3:GetBucketLocation"
            ],
            "Resource": "*"             # on which place is ti allowed to work for me
        }
    ]
}

## how to check, if policy attached to user?
#attach policy with arn ($arn) to user ($my_user)
aws iam attach-user-policy --user-name $my_user --policy-arn $arn

#show the policies of user
aws iam list-attached-user-policies --user-name $my_user --query "AttachedPolicies[*].PolicyArn"

#or also: 
aws iam list-attached-user-policies --user-name $my_user --query "AttachedPolicies[*].PolicyArn" --output text

#show attached policy of user with certain arn (it's like lambda)
 aws iam list-attached-user-policies --user-name $my_user --query "AttachedPolicies[?PolicyArn=='$a
rn'].PolicyArn" --output text

#what you can also do?
#save the output ot line before in variable anch check if the result is empty (zero)

if [ -z $result ]; then 
    echo "empty"
else 
    echo "not empty"
fi
