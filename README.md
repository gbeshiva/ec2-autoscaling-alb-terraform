# EC2 Auto Scaling with Application Load Balancer using Terraform

This Terraform project provisions AWS infrastructure for a scalable Apache web application. It creates an EC2 launch template, an Auto Scaling group, an Application Load Balancer (ALB), and an HTTP listener and target group.

## Architecture

```text
Internet
   |
   v
Application Load Balancer :80
   |
   v
Target Group :80
   |
   +-- EC2 instance
   +-- EC2 instance
   +-- additional instances managed by Auto Scaling
```

## What is provisioned

- AWS provider configured for `ap-south-1` by default
- EC2 launch template using Amazon Linux 2
- Apache HTTP Server installed with EC2 user data
- Auto Scaling group with configurable minimum, desired, and maximum capacity
- Internet-facing Application Load Balancer
- Target group and HTTP listener on port 80
- A basic HTML example in `app/index.html`

## Repository structure

```text
.
├── app/
│   └── index.html       # Example web page
└── infra/
    ├── main.tf          # AWS infrastructure resources
    ├── variables.tf     # Input variables and defaults
    └── state.tf         # Existing Terraform state snapshot
```

## Prerequisites

- Terraform 1.12 or later
- An AWS account
- AWS CLI configured with credentials that can manage EC2, Auto Scaling, ELB, and networking resources
- Existing VPC, subnets, and security group IDs
- A valid Amazon Linux 2 AMI for the selected region

> **Security warning:** An AWS account should not be shared with checked-in credentials or state. `state.tf` contains a Terraform state snapshot, resource IDs, and account information. Do not commit secrets or a live state file without appropriate protection.

## Deployment

Authenticate to AWS, then initialize and apply the configuration:

```bash
cd infra
terraform init
terraform plan
terraform apply
```

Type `yes` when prompted to create the resources.

After deployment, find the load balancer DNS name in the AWS console or Terraform state. Open it in a browser:

```text
http://<load-balancer-dns-name>
```

## Configuration

The default values are defined in `infra/variables.tf`.

| Variable | Description | Default |
|---|---|---|
| `region` | AWS region | `ap-south-1` |
| `ami_id` | Amazon Machine Image ID | `ami-0f535a71b34f2d44a` |
| `instance_type` | EC2 instance type | `t2.micro` |
| `desire_count` | Desired Auto Scaling capacity | `2` |
| `min_count` | Minimum Auto Scaling capacity | `1` |
| `max_count` | Maximum Auto Scaling capacity | `3` |
| `subnet_ids` | Subnets used by the load balancer | Existing subnet IDs |
| `security_group_id` | Security group attached to the load balancer | Existing security group ID |
| `vpc_id` | VPC for the target group | Existing VPC ID |
| `availability_zones` | Zones used by the Auto Scaling group | `ap-south-1a`, `ap-south-1b` |

Pass environment-specific values without modifying the files:

```bash
terraform apply \
  -var="region=ap-south-1" \
  -var="instance_type=t3.micro" \
  -var="desire_count=2" \
  -var="min_count=1" \
  -var="max_count=4"
```

Update the AMI, subnet, security group, and VPC variables to match the AWS account and region in which the project is deployed.

## Cleanup

Remove the resources created by this configuration:

```bash
cd infra
terraform destroy
```

Review the destroy plan carefully before confirming.

## Notes

- The infrastructure does not currently attach the Auto Scaling group to the target group. Add `target_group_arns = [aws_lb_target_group.web_tg.arn]` to the `aws_autoscaling_group` resource and attach it to the target group for traffic routing.
- The ASG currently uses `availability_zones` instead of `subnet_ids` (also spelled `vpc_zone_identifier` in the variables file).
- The target group is not automatically receiving instances until the ASG target-group attachment is configured.
- The HTTP endpoint is unencrypted. Use HTTPS with an ACM certificate and a TLS listener for production workloads.
