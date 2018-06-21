provider "aws" {}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-58d7e821"
  instance_type = "t2.micro"

  tags {
    Name = "Test EC2 Instance"
  }
}
