# Set provider for AWS
provider "aws" {
  region = "us-west-2" # Replace with your desired AWS region
}

# Create a security group for EC2 instance
resource "aws_security_group" "example" {
  name_prefix = "example-"

  # Inbound rule to allow SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to all IPs (can be restricted)
  }

  # Outbound rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-12345678" # Replace with the desired AMI ID (e.g., Amazon Linux)
  instance_type = "t2.micro"      # Instance type (e.g., t2.micro for free tier)
  key_name      = "your-key-pair" # Replace with your SSH key pair name
  security_groups = [aws_security_group.example.name] # Attach security group

  # Optional: User data to run on instance launch
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /var/www/html/index.html
              EOF
}

# Output instance public IP
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
