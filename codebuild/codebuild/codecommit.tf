resource "aws_codecommit_repository" "repo_1" {
  repository_name = var.codecommit-rep
  description     = "This is the private app Repository"
}