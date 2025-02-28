provider "aws" {
  region = "us-west-2"  # Update to your desired region
}

resource "aws_instance" "girish" {
        ami = ""
        instance_type = "t2-micro"
}