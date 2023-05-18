
locals {
  region = "us-west-1"
  account = "xxxxxxxxxxxx"
  res-name = "web-app"
}


module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.6.0"
  repository_name = "${local.res-name}"
  repository_read_write_access_arns = ["arn:aws:iam::${local.account}:user/administrator"]
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "build-pipeline" {
  source = "./codebuild"

  codecommit-rep = "${local.res-name}"

  codebuild-project = "${local.res-name}"
  region = "${local.region}"
  account-id = "${local.account}"
  res-name = "${local.res-name}"
  build-source-location = "https://git-codecommit.${local.region}.amazonaws.com/v1/repos/${local.res-name}"

  
  code-pipeline = "${local.res-name}"
}
