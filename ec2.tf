provider "aws" {
        region="us-east-1"
}
resource "aws_instance" "instance-1" {
        ami="ami-0ed9277fb7eb570c9"
        instance_type="t2.micro"
}
