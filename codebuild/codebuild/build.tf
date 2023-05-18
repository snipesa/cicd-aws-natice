
resource "aws_iam_policy" "policy-cb" {

  name        = var.codebuild-policy1
  path        = "/"
  description = "policy for logs, s3, ecr, codecommit, and codebuild actions be attacched to codebuild role"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:logs:${var.region}:${var.account-id}:log-group:/aws/codebuild/${var.res-name}",
                "arn:aws:logs:${var.region}:${var.account-id}:log-group:/aws/codebuild/${var.res-name}:*"
            ],
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::codepipeline-${var.region}-*"
            ],
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:GetBucketAcl",
                "s3:GetBucketLocation"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "*"
            ],
            "Action": [
                "ecr:*"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:codecommit:${var.region}:${var.account-id}:${var.res-name}"
            ],
            "Action": [
                "codecommit:GitPull"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "codebuild:CreateReportGroup",
                "codebuild:CreateReport",
                "codebuild:UpdateReport",
                "codebuild:BatchPutTestCases",
                "codebuild:BatchPutCodeCoverages"
            ],
            "Resource": [
                "arn:aws:codebuild:${var.region}:${var.account-id}:report-group/${var.res-name}-*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role" "role-code-build" {
  name = var.codebuild-role

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })

  managed_policy_arns = [aws_iam_policy.policy-cb.arn]

}

resource "aws_codebuild_project" "build-project" {
  name          = var.codebuild-project
  description   = "test_codebuild_project"
  build_timeout = "10"
  service_role  = aws_iam_role.role-code-build.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }


  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:3.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode = true

  }

  source {
    type            = "CODECOMMIT"
    location = var.build-source-location
    }
  }
   
