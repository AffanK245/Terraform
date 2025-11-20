provider "aws" {
  region = "eu-north-1"
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

resource "aws_instance" "MyEC21" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "EC2-Instance"
  }
}

resource "null_resource" "run_ansible" {
  depends_on = [aws_instance.MyEC21]

  provisioner "local-exec" {
    command = "sleep 30 && ansible-playbook -i host.ini playbook.yaml"
  }
}




