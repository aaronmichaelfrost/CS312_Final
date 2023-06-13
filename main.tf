provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "minecraft" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.small"
  key_name               = "minecraft_key_final"
  vpc_security_group_ids = [aws_security_group.minecraft_sg.id]
  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "My Crazy MC Server"
  }

  user_data = <<-EOF
                #!/bin/bash

                sudo apt-get update
                sudo apt-get install -y openjdk-11-jre-headless
                sudo apt-get install -y openjdk-17-jdk
                wget https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar
                java -Xmx1024M -Xms1024M -jar server.jar nogui
                sed -i 's/false/true/Ig' eula.txt
                java -Xmx1024M -Xms1024M -jar server.jar nogui

                cat << EOT | sudo tee /etc/systemd/system/minecraft.service
                [Unit]
                Description=Minecraft Server
                [Service]
                WorkingDirectory=/home/ubuntu
                ExecStart=/usr/bin/java -Xmx1024M -Xms1024M -jar server.jar nogui
                User=ubuntu
                Type=simple
                Restart=always
                RestartSec=10
                [Install]
                WantedBy=multi-user.target
                EOT

                sudo systemctl daemon-reload
                sudo systemctl enable minecraft.service
                sudo systemctl start minecraft.service
                EOF
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft_server_security_group_final"
  description = "Security group for Minecraft server"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_public_ip" {
  value = aws_instance.minecraft.public_ip
  description = "The public IP of the Minecraft server."
}

output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.minecraft.id
}