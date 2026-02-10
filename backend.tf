# terraform {
#   backend "s3" {
#     bucket         = "eks-terraform-state-0002"
#     key            = "eks/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "my-terraform-locks"
#     encrypt        = true
#   }
# }