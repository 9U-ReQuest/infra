terraform {
    backend "s3" {
        bucket = "request-tf-states"
        key = "network"
        region = "${var.aws_region}"
    }
}

check "workspace" {
    assert {
        condition = terraform.workspace != "default"
        error_message = "Do not use default workspace. abort."
    }
}

provider "aws" {
    region = "${var.aws_region}"
}