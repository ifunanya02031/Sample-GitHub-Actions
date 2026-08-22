# Project 3: DevSecOps CI/CD Pipeline
# DevSecOps CI/CD Pipeline
Overview

This project demonstrates a DevSecOps pipeline using GitHub Actions, Terraform, Terragrunt, and KICS to automate Infrastructure-as-Code validation, security scanning, and deployment.

The goal was to integrate security checks directly into the CI/CD workflow and automate infrastructure provisioning through GitHub.

Architecture
GitHub Push
      │
      ▼
GitHub Actions
      │
      ▼
KICS Scan
      │
      ▼
Terraform/Terragrunt
      │
      ▼
AWS Infrastructure
Technologies Used
Technology	Purpose
GitHub Actions	CI/CD automation
Terraform	Infrastructure provisioning
Terragrunt	Terraform orchestration
KICS	IaC security scanning
AWS	Cloud deployment
S3	Remote state
DynamoDB	State locking
Workflow
Pull Request
PR Created
    │
    ▼
KICS Scan
Push to Main
Push
   │
   ▼
KICS Scan
   │
   ▼
Terraform Validate
   │
   ▼
Terraform Plan
   │
   ▼
Terraform Apply
Security Features
KICS Integration

Infrastructure code is scanned for:

Hardcoded secrets
Misconfigured security groups
Publicly exposed resources
IAM permission issues
Encryption misconfigurations
GitHub Secrets

AWS credentials stored securely using:

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
Future Enhancements
OIDC Federation
AWS IAM Role Assumption
Eliminate long-lived AWS credentials
Terraform Structure
modules/
├── ec2/
└── s3/


src/
├── ec2/
└── s3/


terragrunt/
├── ec2/
├── s3/
└── root.hcl
Terragrunt Features
Remote State
remote_state {
  backend = "s3"
}

Benefits:

Centralized state storage
State encryption
Team collaboration
Disaster recovery
State Locking
dynamodb_table = "my-DB-table-statelocking"

Benefits:

Prevents concurrent deployments
Protects state integrity
Eliminates race conditions
