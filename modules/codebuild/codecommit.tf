resource "aws_codecommit_repository" "repo_1" {
  repository_name = var.repo_name
  description     = "code commit Repo for ${var.repo_name}"
}