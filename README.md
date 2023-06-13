# Minecraft Server Assignment
 
# Background
## What will we do?
Create a Minecraft server backed by AWS without using AWS Dashboard. The server auto reboots, is joinable, and shuts down properly
## How will we do it?
Using Terraform and the AWS CLI
# Requirements
- A valid AWS account with an Access Key ID, Secret Access Key, and Session Token
- Install AWS CLI V2 (Windows Powershell: `msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi`)
- Terraform (Windows Powershell: `choco install terraform`)
- Minecraft Java Client version 1.19.4
# Major Steps in Pipeline

# Commands to Run
1. First, clone this repository, then using a CLI (Git Bash works great on Windows), CD into the root of this repository on your local machine.
`cd /your/path/to/CS312_Final`
2. Export your AWS credentials so we can connect using Terraform
``` 
export AWS_ACCESS_KEY_ID=<yours>
export AWS_SECRET_ACCESS_KEY=<yours>
export AWS_SESSION_TOKEN=<yours>
```
3. `terraform init` -> Initialize a working directory for Terraform
4. `terraform apply` -> Create the AWS infastructure
5. Now, wait until the console prints out the IP address of the Minecraft Server
6. To test rebooting, enter `aws ec2 describe-instances --filter "Name=tag:Name,Values=Minecraft Server" --query "Reservations[*].Instances[*].InstanceId"`
Then copy the instance id from the Terraform output. It should look like this: `i-05a55ecbf2f5e90e6`
Then run this but replace the id with your instance id: `aws ec2 reboot-instances --instance-ids i-05a55ecbf2f5e90e6` 


# How To Connect
1. Open Minecraft version 1.19.4
2. Multiplayer -> Direct Connection -> Enter the public ip logged to you by Terraform followed by ":25565" (no quotation marks)
3. Click "Join Server"

## Sources Cited
