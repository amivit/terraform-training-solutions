provider "aws" {}

resource "aws_instance" "web_server" {
  ami           = "ami-58d7e821"
  instance_type = "t2.micro"

  tags {
    Name = "Test EC2 Instance"
  }
}
