# CodeDeploy 배포 그룹: GASI
resource "aws_codedeploy_deployment_group" "gasi" {
  app_name              = aws_codedeploy_app.request.name
  deployment_group_name = "request-${terraform.workspace}.codedeploy.group.gasi"
  service_role_arn      = aws_iam_role.codedeploy.arn
  ec2_tag_filter {
    type  = "KEY_AND_VALUE"
    key   = "Name"
    value = "request-${terraform.workspace}.gasi"
  }
  deployment_config_name = "CodeDeployDefault.OneAtATime"
  auto_rollback_configuration {
    enabled = true
    events = ["DEPLOYMENT_FAILURE"]
  }
  tags = {
    Name = "request-${terraform.workspace}.codedeploy.group.gasi"
  }
}

# CodeDeploy 배포 그룹: AGI
resource "aws_codedeploy_deployment_group" "agi" {
  app_name              = aws_codedeploy_app.request.name
  deployment_group_name = "request-${terraform.workspace}.codedeploy.group.agi"
  service_role_arn      = aws_iam_role.codedeploy.arn
  ec2_tag_filter {
    type  = "KEY_AND_VALUE"
    key   = "Name"
    value = "request-${terraform.workspace}.agi"
  }
  deployment_config_name = "CodeDeployDefault.OneAtATime"
  auto_rollback_configuration {
    enabled = true
    events = ["DEPLOYMENT_FAILURE"]
  }

  tags = {
    Name = "request-${terraform.workspace}.codedeploy.group.agi"
  }
}

# CodeDeploy 배포 그룹: CARI
resource "aws_codedeploy_deployment_group" "cari" {
  app_name              = aws_codedeploy_app.request.name
  deployment_group_name = "request-${terraform.workspace}.codedeploy.group.cari"
  service_role_arn      = aws_iam_role.codedeploy.arn
  ec2_tag_filter {
    type  = "KEY_AND_VALUE"
    key   = "Name"
    value = "request-${terraform.workspace}.cari"
  }
  deployment_config_name = "CodeDeployDefault.OneAtATime"
  auto_rollback_configuration {
    enabled = true
    events = ["DEPLOYMENT_FAILURE"]
  }
}