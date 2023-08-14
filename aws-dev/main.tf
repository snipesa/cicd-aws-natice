module "_codebuild_cicd" {
  source = "github.com/snipesa/cicd-aws-natice/tree/main/modules/codebuild"

  repo_name = "web-app"



# locals {
#   region = "us-west-1"
#   account = "xxxxxxxxxxxx"
#   res-name = "web-app"
# }

 # region = "${local.region}"
 # build-source-location = "https://git-codecommit.${local.region}.amazonaws.com/v1/repos/${local.res-name}"

}
