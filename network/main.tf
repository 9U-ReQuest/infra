terraform {
    backend "s3" {
        bucket = "request-tf-states"
        key = "network"
        region = "ap-northeast-2"
    }
}

check "workspace" {
    assert {
        condition = terraform.workspace != "network"
        error_message = "Do not use default workspace. abort."
    }
}

provider "aws" {
    region = "ap-northeast-2"
}