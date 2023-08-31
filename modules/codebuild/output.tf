output "ecr-arn" {
  value = aws_ecr_repository.ecr.arn
}

output "codecommit-arn" {
  value = aws_codecommit_repository.repo_1.arn
}

output "s3-arn" {
  value = aws_s3_bucket.codepipeline_bucket.arn
}

output "pipeline-arn" {
  value = aws_codepipeline.code-pipeline.arn
}

