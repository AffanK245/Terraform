provider "aws" {
    region = "eu-north-1"
}
resource "null_resource" "run_ansible" {
  depends_on = [aws_instance.web]
 
  provisioner "local-exec" {
    command = "ansible-playbook -i host.ini playbooks.yaml"
  }
}
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-affan1"
    key            = "prod/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "2439071dynamodb"
    encrypt        = true
  }
}
resource "aws_instance" "MyEC2" {
    ami           = var.ami_id
    instance_type = var.instance_type
    key_name      = "my-keypair" 
    tags = {
      Name = "EC2-Instance-Affan"
    }
}





