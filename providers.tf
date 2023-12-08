terraform {
  cloud {
    organization = "Ayodev"

    workspaces {
      name = "3-RDS-Instances"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

