

locals {
  region = "us-west-1"
  account = "xxxxxxxxxxxxx"
  res-name = "web-app"
}

resource "aws_codecommit_repository" "repo_1" {
  repository_name = "${local.res-name}"
  description     = "This is the private app Repository"
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

module "build-project" {
  source = "./codebuild"
  codebuild-project = "${local.res-name}"
  region = "${local.region}"
  account-id = "${local.account}"
  res-name = "${local.res-name}"
}

module "code-pipeline" {
  source = "./codepipeline"
  pipeline = "${local.res-name}"
}


