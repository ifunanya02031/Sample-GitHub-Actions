# DevSecOps CI/CD Pipeline

## Overview

This project demonstrates a DevSecOps CI/CD pipeline built with GitHub Actions, Terraform, Terragrunt, and KICS. The pipeline automates infrastructure validation, security scanning, planning, and deployment while incorporating Infrastructure-as-Code (IaC) security controls before AWS resources are provisioned.

The goal of this project was to implement a repeatable deployment process that integrates security into the software delivery lifecycle through automation and Infrastructure-as-Code.

---

## Technologies Used

### Cloud
- AWS

### Infrastructure as Code
- Terraform
- Terragrunt

### CI/CD
- GitHub Actions

### Security
- KICS (Keeping Infrastructure as Code Secure)

### State Management
- Amazon S3
- DynamoDB

---

## Architecture

```text
Developer Push
      │
      ▼
GitHub Actions
      │
      ▼
KICS Security Scan
      │
      ▼
Terraform Validation
      │
      ▼
Terraform Plan
      │
      ▼
Terraform Apply
      │
      ▼
AWS Infrastructure
```

---

## Key Features

### Infrastructure as Code

Infrastructure is provisioned using Terraform modules to promote reusability and consistency.

```text
modules/
├── ec2/
└── s3/

src/
├── ec2/
└── s3/
```

The `modules` directory contains reusable infrastructure definitions, while the `src` directory provides environment-specific values and module invocations.

---

### Terragrunt Orchestration

Terragrunt is used as a wrapper around Terraform to:

- Reduce configuration duplication
- Centralize backend configuration
- Manage Terraform remote state
- Simplify multi-module deployments
- Support environment-based deployments

---

### Security Scanning

KICS is integrated into the pipeline to perform Infrastructure-as-Code security analysis before deployment.

Example findings include:

- Hardcoded secrets
- Publicly exposed resources
- Insecure security groups
- Encryption misconfigurations
- Excessive IAM permissions

---

### Remote State Management

Terraform state is stored remotely using Amazon S3.

```hcl
remote_state {
  backend = "s3"
}
```

Benefits include:

- Centralized state management
- Team collaboration support
- State persistence
- Disaster recovery capabilities

---

### State Locking

DynamoDB is used to prevent concurrent Terraform executions.

```hcl
dynamodb_table = "terraform-state-locks"
```

Benefits:

- Prevents race conditions
- Protects state integrity
- Prevents simultaneous modifications

---

## Workflow

### Pull Requests

When a pull request is opened against the `main` branch:

1. GitHub Actions is triggered
2. KICS scans the Terraform codebase
3. Security findings are reported

### Pushes to Main

When code is merged into `main`:

1. KICS executes security scans
2. Terraform validates configuration
3. Terraform generates an execution plan
4. Terraform deploys infrastructure
5. AWS resources are provisioned

---

## Repository Structure

```text
.
├── .github/
│   └── workflows/
│       ├── github-actions.yml
│       └── terra-kics.yml
│
├── modules/
│   ├── ec2/
│   └── s3/
│
├── src/
│   ├── ec2/
│   └── s3/
│
└── terragrunt/
    ├── ec2/
    ├── s3/
    └── root.hcl
```

---

## Security Controls

- Infrastructure-as-Code security scanning
- Least-privilege AWS access
- Remote state encryption
- State locking
- GitHub Secrets management
- Terraform validation prior to deployment

---

## Future Improvements

- AWS OIDC Federation
- Multi-environment deployments
- Automated rollback strategies
- Additional SAST/DAST integrations
- Policy-as-Code validation

---

## Lessons Learned

This project provided hands-on experience with:

- Infrastructure as Code
- CI/CD automation
- DevSecOps principles
- Terraform modularization
- Terragrunt orchestration
- AWS state management
- Security-first deployment pipelines
