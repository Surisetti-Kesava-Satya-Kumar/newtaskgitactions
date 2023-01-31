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

resource "aws_instance" "demo" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "Demo"
  }
}

# output "web-address" {
#   value = "${aws_instance.demo.public_dns}:8080"
# }
