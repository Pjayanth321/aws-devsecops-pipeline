resource "aws_s3_bucket" "devsecops_code_bucket" {
  bucket = "pjayanth-devsecops-bucket-0725"
  tags = {
    Name        = "DevSecOps Code Bucket"
    Environment = "Dev"
  }
}

resource "aws_ecr_repository" "devsecops_app_repo" {
  name = "devsecops-app"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name        = "DevSecOps ECR Repo"
    Environment = "Dev"
  }
}
