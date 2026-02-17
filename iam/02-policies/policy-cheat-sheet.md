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
