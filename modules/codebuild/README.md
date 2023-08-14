*The module contains :

1. Codecommit.tf file with the code to build a private repository to store the application code
2. Build.tf file with the policy, role and codebuild execution project to the build the image
3. Ecr.tf file with the code to build an ecr registry to store the images
4. S3.tf file that contains the artifacts for codepipline.
5. Pipeline.tf to ochestrate the entire CI pipeline. This is such that upon a push to the codecommit repo, codebuild can automatically download the source and build the application.  
The pipeline.tf contains the policy role and project stages to build the pipeline
