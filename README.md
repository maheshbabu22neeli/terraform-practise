# Terraform-Practise 

#### Providers 
- AWS
- Azure
- GitHub
- etc.,. can connect to many tools

- AWS Provider developed by both AWS and Terraform

#### Commands
- `terraform init` -> Download the provider
- `terraform plan` -> Plan the infrastructure, but it will not create
- `terraform apply` -> Create the infrastructure
- `terraform destroy` -> Destroy the infrastructure

#### Variables Types
- string
- number
- map
- list
- set
- bool

###### Variables can be passed through
```text
1. Default variables ex: variables.tf
2. Terraform variables ex: terraform.tfvars
3. Command Line       ex: terraform plan -var="sg_name=allow-all-terraform-cmd"
4. Environment Variables  ex: export TF_VAR_<NAME>=<VALUE>
```

###### Precedent goes through
```text
1. Command Line
2. Terraform tf vars
3. Environment variables
4. Default Variables
```

#### Condition
- Conditional Expression  -> ex: `var.environment == "dev" ? "t3.micro"" : "t3.small"`


#### Loops
- Count Based Loops
- For_Each Loops   (Can only apply through Map or Set. ForEach cannot be applied through list)
- Dynamic Block Loops


