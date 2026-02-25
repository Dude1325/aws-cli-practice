# 🚀 IAM Practice: Role Management & Automation

This module focuses on automating the lifecycle of IAM Roles using the AWS CLI. The core objective is to achieve **Idempotency**—ensuring scripts can be executed multiple times without errors or duplicate resources.

---

## 🏗️ Project Roadmap & Tasks

### Task 1: Create an EC2 Service Role
**File:** `create-role.sh`
* **Goal:** Create a role named `EC2-ReadOnly-Web-Role`.
* **Requirement:** Roles require a **Trust Policy** (AssumeRolePolicyDocument).
* **Logic:**
    1. Check if the role already exists using `aws iam get-role`.
    2. If it exists, skip creation.
    3. If not, create it using a local `trust-policy.json` file.
* **Definition of Done:** Running the script twice results in an "Already exists" message instead of an AWS CLI error.

### Task 2: Attach Permissions (Policy Attachment)
**File:** `attach-policy-to-role.sh`
* **Goal:** Attach the AWS-managed policy `AmazonS3ReadOnlyAccess` to the role.
* **Logic:**
    1. List attached policies for the role.
    2. Use a JMESPath query to check if the specific Policy ARN is already present.
    3. Attach only if missing.

### Task 3: Setup Instance Profile (The EC2 Bridge)
**Files:** `create-instance-profile.sh` & `add-role-to-profile.sh`
* **Concept:** EC2 instances don't use roles directly; they use **Instance Profiles** as containers for roles.
* **Steps:**
    1. Create the Instance Profile.
    2. Add the IAM Role to the Instance Profile.
* **Challenge:** You cannot add a role to a profile if it's already there. Implement a check!

### Task 4: Verification & Reporting
**File:** `list-roles.sh`
* **Goal:** Generate a clean report of all roles created during this practice.
* **Filter:** Use `--query` to display only `RoleName`, `Arn`, and `CreateDate` in a `table` format.

### Task 5: The "Graceful Cleanup" (Advanced)
**File:** `delete-role.sh`
* **Goal:** Completely tear down the infrastructure.
* **Constraint:** AWS prevents deleting roles that are still attached to profiles or have active policies.
* **Execution Order:**
    1. Remove role from Instance Profile (`remove-role-from-instance-profile`).
    2. Delete the Instance Profile.
    3. Detach all managed policies from the role.
    4. Delete the IAM Role.

---

## 🛠️ Reference Snippets

### 1. Trust Policy (`trust-policy.json`)
This allows the EC2 service to assume the role:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "Service": "ec2.amazonaws.com" },
      "Action": "sts:AssumeRole"
    }
  ]
}
