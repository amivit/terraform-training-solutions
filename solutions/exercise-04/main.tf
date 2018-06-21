provider "aws" {
  region = "eu-west-1"
}

variable "ec2_instance_tag_name" {
  default = "Test Server"
}

resource "aws_instance" "web_server" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    Name = "${var.ec2_instance_tag_name}"
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

resource "aws_s3_bucket_object" "index" {
  bucket       = "${var.bucket_name}"
  key          = "index.html"
  source       = "${path.module}/../shared/index.html"
  etag         = "${md5(file("${path.module}/../shared/index.html"))}"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "404" {
  bucket       = "${var.bucket_name}"
  key          = "404.html"
  source       = "${path.module}/../shared/404.html"
  etag         = "${md5(file("${path.module}/../shared/404.html"))}"
  content_type = "text/html"
}

output "s3_website_endpoint" {
  value = "${aws_s3_bucket.b.website_endpoint}"
}
