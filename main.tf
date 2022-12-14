 terraform {
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = "~> 4.0"
     }
   }
 }



resource "aws_apprunner_service" "micro" {

  service_name = "micro"

  source_configuration {
    authentication_configuration{
      access_role_arn=  "arn:aws:iam::530211691714:role/service-role/microapp"
}
    
    image_repository {
      image_configuration {
        port = "80"
      }
      image_identifier      = "530211691714.dkr.ecr.ap-northeast-1.amazonaws.com/microweb:latest"
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = false
    
 
  }

  tags = {
    Name = "micro-apprunner-service"
  }
}

