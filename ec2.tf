provider "aws" {
        region="us-east-1"
}

resource "aws_instance" "My-ec2" {
        instance_type=var.instance_type
        ami=var.ec2_ami
        tags ={
                Name=var.instance_name
        }
}
