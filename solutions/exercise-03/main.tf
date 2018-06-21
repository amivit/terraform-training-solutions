provider "aws" {
  region = "eu-west-1"
}

variable "ec2_instance_tag_name" {
  default = "Test Web Server"
}

resource "aws_instance" "web_server" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    Name = "${var.ec2_instance_tag_name}"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket_name}"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev"
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  policy = "${data.template_file.website_bucket_policy_file.rendered}"
}

data "template_file" "website_bucket_policy_file" {
  template = "${file("${path.module}/../shared/website_bucket_policy.json")}"

  vars {
    bucket = "${var.bucket_name}"
  }
}

variable "bucket_name" {
  default = "test-bucket-aw29i7d2hya9278y28"
}
