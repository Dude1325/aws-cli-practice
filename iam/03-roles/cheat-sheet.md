
## how it works?
🧠 The IAM Role Analogy: "The Hat and the Cashier"
To understand IAM Roles, think of it as a two-step process involving a Trust Policy and a Permissions Policy.

Step 1: The Trust Policy (The "Who")
The Concept: This is like a document that says: "Roman is allowed to wear this special Hat."

Term: Trust Relationship / AssumeRolePolicyDocument.

Action: sts:AssumeRole.

In JSON: The Principal field defines who (User, Service like EC2) can put on the hat.

Step 2: The Permissions Policy (The "What")
The Concept: This is like a rulebook kept by the Cashier. It says: "Anyone wearing this special Hat is allowed to take money from the cash register."

Term: Identity-based Policy.

Action: s3:GetObject, ec2:RunInstances, etc.

In JSON: The Action and Resource fields define what the person wearing the hat can actually do.

⚠️ The Key Distinction (The Two Stages)
Trust Stage: You define who can become the Role. (Without this, you can't even put the hat on).

Permissions Stage: You define what the Role can do. (Without this, you are wearing a hat but have no power).

Result: Once Roman (Principal) assumes the Role (Trust), he gets temporary credentials that allow him to access the Cashier (AWS Resources) based on the hat's rules (Permissions).



# how it looks like?
it's also an json file.

# Structure of the file Trust Role (file):

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
} 

1.Version - just do it
2.Statement - description of the policy 
    could i have more, than just one statement?
    should i make nested policies? best practice?


2.1 Effect - Allow/Deny?
2.2 Principal - who should be allowed to do it(=action)
2.3 whoat is allowed to do
