resource "aws_codebuild_project" "devsecops_app_build" {
  name          = "DevSecOpsAppBuild"
  description   = "Builds Docker image and pushes to ECR"
  build_timeout = 5

  service_role = aws_iam_role.codebuild_service_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
    environment_variable {
      name  = "ECR_REPO"
      value = "devsecops-app"
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/Pjayanth321/devsecops-app.git"
    buildspec       = "buildspec.yml"
    git_clone_depth = 1
  }

  tags = {
    Name        = "DevSecOps CodeBuild"
    Environment = "Dev"
  }
}
