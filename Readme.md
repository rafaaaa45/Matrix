# Matrix - Terraform Security & Compliance Playground

This repository contains intentionally insecure and non-compliant Terraform code for Google Cloud Platform (GCP).  
It is designed to help you explore and test open-source Infrastructure as Code (IaC) security and linting tools, including:

- [tfsec](https://github.com/aquasecurity/tfsec)
- [tflint](https://github.com/terraform-linters/tflint)
- [checkov](https://github.com/bridgecrewio/checkov)

## Purpose

- **Learn** how security and compliance tools detect misconfigurations and risks in Terraform code.
- **Experiment** with different scenarios: public buckets, open firewalls, weak IAM, unencrypted resources, and more.
- **Compare** the findings and coverage of different tools.

## Structure

```
Matrix/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── storage_bucket/
    ├── firewall/
    ├── iam/
    ├── sql/
    └── compute/
```

Each module contains resources with common security and compliance issues for testing.

## How to Use

1. **Clone this repository** to your local machine.
2. **Install the tools** you want to test (see below).
3. **Run the tools** in the project root:
    - `tfsec .`
    - `tflint`
    - `checkov -d .`
4. **Review the findings** and compare results.

> **Note:**  
> This code is NOT intended for production use.  
> It is insecure by design and should only be used for learning and tool evaluation.

## Tool Installation

- **tfsec:**  
  - [Install instructions](https://aquasecurity.github.io/tfsec/v1.28.14/getting-started/installation/)
- **tflint:**  
  - [Install instructions](https://github.com/terraform-linters/tflint#installation)
- **checkov:**  
  - `pip install checkov` or see [official docs](https://www.checkov.io/1.Welcome/Installation.html)

## Scenarios Covered

- Public storage buckets
- Buckets without logging, versioning, or encryption
- Firewall rules open to the world
- Compute instances with public IPs and missing Shielded VM
- SQL databases with public access, no SSL, no backups, no encryption
- IAM roles with excessive permissions

## Why Use tfsec, tflint, and checkov Instead of Only `terraform validate`?

### `terraform validate`
- **Purpose:** Checks if your Terraform code is syntactically correct and internally consistent.
- **What it does:** Finds syntax errors, missing variables, or invalid references.  
  Does **not** check for security, best practices, or cloud-specific misconfigurations.

### tfsec, tflint, checkov
- **Purpose:** Go beyond syntax—they check for security issues, best practices, and compliance.
- **What they do:**
  - **tfsec & checkov:** Find security risks (public buckets, open firewalls, missing encryption, etc.).
  - **tflint:** Finds code quality issues, deprecated syntax, and provider-specific problems.

### Should you use them?
**Yes!**
- `terraform validate` is necessary, but only checks for syntax and internal logic.
- **tfsec, tflint, and checkov** catch real-world risks and mistakes that `terraform validate` will never find.
- Using them together gives you much better coverage and safer infrastructure code.

---

## License

This repository is for educational and testing purposes only.

---

Feel free to modify the code to test additional scenarios or to see how the tools respond to different configurations.