# CS312_Final
 
## Background
# What will we do?
Create a Minecraft server backed by AWS without using AWS Dashboard. The server auto reboots, is joinable, and shuts down properly
# How will we do it?
Using Terraform and the AWS CLI
## Requirements
- A valid AWS account with an Access Key ID, Secret Access Key, and Session Token
- Install AWS CLI V2 (Windows Powershell: `msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi`)
- Terraform (Windows Powershell: `choco install terraform`)
- Minecraft Java Client
## Diagram

## Commands to Run
1. First, clone this repository, then using a CLI (Git Bash is used in this tutorial), CD into the root of this repository on your local machine.
2. Export your AWS credentials so we can connect using terraform
``` 
export AWS_ACCESS_KEY_ID=<yours>
export AWS_SECRET_ACCESS_KEY=<yours>
export AWS_SESSION_TOKEN=<yours>
```
3. `terraform init`
4. `terraform apply`
5. Now, wait until the console prints out the IP address of the Minecraft Server

## Sources Cited
