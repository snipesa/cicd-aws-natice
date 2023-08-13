data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3-pipeline" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [
        aws_iam_role.role-pipeline.arn,
        aws_iam_role.role-code-build.arn
      ]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
      "s3:GetObjectAcl",
      "s3:GetObjectVersion",
      "s3:PutObject"
      
    ]

    resources = [
      aws_s3_bucket.codepipeline_bucket.arn,
      "${aws_s3_bucket.codepipeline_bucket.arn}/*",
    ]
  }
} 