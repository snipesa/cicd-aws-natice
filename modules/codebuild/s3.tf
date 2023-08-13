resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "${var.repo_name}-pipeline-artiifacts"
}

resource "aws_s3_bucket_public_access_block" "s3-public" {
  bucket = aws_s3_bucket.codepipeline_bucket.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_policy" "s3-codepipeline" {
  bucket = aws_s3_bucket.codepipeline_bucket.id
  policy = data.aws_iam_policy_document.s3-pipeline.json



}
