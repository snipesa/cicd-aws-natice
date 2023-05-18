variable "codebuild-policy1" {
  default = "code-build-policy"
}

variable "codebuild-role" {
  default = "code-build-role"
}

variable "codebuild-project" {
  default = "web-app"
}

variable "region" {
  default = "us-west-1"
}

variable "account-id" {
  type = number
  default = 11111222225
}

variable "res-name" {
  default = "web-app"
}

variable "build-source-location" {
  default = "https://git-codecommit.us-west-1.amazonaws.com/v1/repos/web-app"
}


variable "pipeline-policy1" {
  default = "code-pipeline-policy"
}

variable "pipeline-role1" {
  default = "code-pipeline-role"
}

variable "code-pipeline" {
  default = "web-app"
}

variable "pipeline-s3-bucket" {
  default = "web-app-pipeline-112"
}

variable "codecommit-rep" {
  default = "web-app"
}

variable "buildproject-name" {
  default = "web-app"
}