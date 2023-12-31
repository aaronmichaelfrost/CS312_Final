# Minecraft Server Assignment
 
# Background
## What will we do?
Create a Minecraft server backed by AWS without using AWS Dashboard. The server auto reboots, is joinable, and shuts down properly
## How will we do it?
Using Terraform to provision an EC2 server, install Minecraft, and setup a service to automatically restart the Minecraft server
# Requirements
- A valid AWS account with an Access Key ID, Secret Access Key, and Session Token
- Install AWS CLI V2 (Windows Powershell: `msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi`)
- Terraform (Windows Powershell: `choco install terraform`)
- Minecraft Java Client version 1.19.4
# Terraform Overview
The script `main.tf` executes the following steps:

![Alt text](/images/diagram1.png?raw=true)

# Commands to Run
1. First, clone this repository, then using a CLI (Git Bash works great on Windows), CD into the root of this repository on your local machine.
`cd /your/path/to/CS312_Final`
2. Export your AWS credentials so we can let Terraform setup the server
``` 
export AWS_ACCESS_KEY_ID=<yours>
export AWS_SECRET_ACCESS_KEY=<yours>
export AWS_SESSION_TOKEN=<yours>
```
3. `terraform init` -> Initialize a working directory for Terraform
4. `terraform apply` -> Create the AWS infastructure
5. Now, wait until the console prints out the IP address of the Minecraft Server

# How To Connect
1. Open Minecraft version 1.19.4
2. Multiplayer -> Direct Connection -> Enter the public ip logged to you by Terraform followed by ":25565" (no quotation marks)
3. Click "Join Server"

## Sources Cited
- My last Minecraft server assignment
- ChatGPT
