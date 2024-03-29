# Continuous Integration Automation

A complete CICD project using terraform to deploy with aws native tools.
The repo consist of 3 seperate directories
- aws-dev
- ci-app
- modules/codebuild

*The terraform code is written in the form of a module 

## aws-dev

The folder contains the provider.tf and the main.tf which will be used to deploy your application referencing your module

## ci-app
This folder contains the application code and all its dependencies required to build the image
It therefore include the application code, files, buildspec.yml, appspec.yml and the dockerfile

## module/codebuild

*The module contains :

1. Codecommit.tf file with the code to build a private repository to store the application code
2. Build.tf file with the policy, role and codebuild execution project to the build the image
3. Ecr.tf file with the code to build an ecr registry to store the images
4. S3.tf file that contains the artifacts for codepipline.
5. Pipeline.tf to ochestrate the entire CI pipeline. This is such that upon a push to the codecommit repo, codebuild can automatically download the source and build the application.  
The pipeline.tf contains the policy role and project stages to build the pipeline
