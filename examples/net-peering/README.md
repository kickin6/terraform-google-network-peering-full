# Network Peering Two Projects in Google Cloud

This example creates a network and a sub-network in two projects then joins the networks using VPC network peering.

**Figure 1.** *diagram of Network Peering*

![architecture diagram](https://cloud.google.com/vpc/images/peering/network-peering-03.svg)
Image from https://cloud.google.com/vpc/images/peering/network-peering-03.svg

## References
https://cloud.google.com/sdk/docs/authorizing

https://cloud.google.com/iam/docs/understanding-roles#compute_engine_roles

## Requirements
1. Two projects created in Google Cloud.
2. Service account in project #1 with Compute Network Admin privileges and downloaded service account key file.
3. Service account ID (from step #2) added in project #2 as IAM member with Compute Network Admin privileges.
 
## Setup Environment
Replace `project1` and `project2` with your actual project ids.
```
export TF_VAR_project1=project1
export TF_VAR_project2=project2
```

## Run Terrraform
```
terraform init
terraform plan
terraform apply
```

## Verification
In the GCP Console, for each project, verify VPC network -> VPC network peering has a peering connection named peer1 and is connected.

## Cleanup
Remove all resourced created by terraform:
```
terraform destroy
```