terraform {
  backend "s3" {
    bucket = "request-tf-states"
    key    = "cari"
    region = "ap-northeast-2"
  }
}

check "workspace" {
  assert {
    condition     = terraform.workspace != "default"
    error_message = "Do not use default workspace. abort."
  }
}

provider "aws" {
  region = var.aws_region
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "request-tf-states"
    key    = "env:/${terraform.workspace}/network"
    region = "ap-northeast-2"
  }
}

data "terraform_remote_state" "codedeploy" {
  backend = "s3"
  config = {
    bucket = "request-tf-states"
    key    = "env:/${terraform.workspace}/codedeploy"
    region = "ap-northeast-2"
  }
}
