
# locals {
#   region = "us-west-1"
#   account = "xxxxxxxxxxxx"
#   res-name = "web-app"
# }


module "_codebuild_cicd" {
  source = "../modules/codebuild"

  repo_name = "web-app"
 # region = "${local.region}"
 # build-source-location = "https://git-codecommit.${local.region}.amazonaws.com/v1/repos/${local.res-name}"

}
