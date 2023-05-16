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