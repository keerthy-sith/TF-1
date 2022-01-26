provider "aws" {
        region="us-east-1"
}

resource "aws_instance" "Workspace-vm" {
        ami=lookup(var.ec2_ami,terraform.workspace)
        instance_type=lookup(var.ec2_instance_type,terraform.workspace)
        key_name="Jenkins"
        tags={
                Name=lookup(var.instance_name,terraform.workspace)
        }
}

