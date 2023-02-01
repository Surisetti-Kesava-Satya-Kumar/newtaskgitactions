terraform {
  required_version = ">= 1.1.0"
  cloud {
    organization = "wwwsatyaprod"
    workspaces {
      name = "task-env"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "primeStore-key-pair" {
  key_name   = "satya"
  public_key = ${{ secrets.TF_PUBLIC_KEY }}
}

resource "aws_instance" "demo" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.primeStore-key-pair.id
  tags = {
    Name = "Demo"
  }
}

output "web-address" {
  value = "${aws_instance.demo.public_ip}"
}