terraform {
  cloud {
    organization = "024_2023-summer-cloud-t"

    workspaces {
      name = "infra-subnet"
    }
  }

   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_subnet" "main" {
  vpc_id     = data.aws_vpc.selected.id
  cidr_block = cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)

  tags = {
    Name = "Main"
  }
}