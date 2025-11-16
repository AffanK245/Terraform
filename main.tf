provider "aws" {
    region = "eu-north-1"
}
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-affan"
    key            = "prod/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "2439071dynamodb"
    encrypt        = true
  }
}
resource "aws_instance" "MyEC2" {
    ami           = var.ami_id
    instance_type = var.instance_type
    tags = {
      Name = "EC2-Instance-Affan"
    }
}


