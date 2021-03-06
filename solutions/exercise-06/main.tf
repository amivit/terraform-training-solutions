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
    Name      = "${var.ec2_instance_tag_name}"
    Workspace = "${terraform.workspace}"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket_name}-workspace-${terraform.workspace}"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev"
    Workspace   = "${terraform.workspace}"
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  policy = "${data.template_file.website_bucket_policy_file.rendered}"
}

resource "aws_s3_bucket_object" "index" {
  bucket       = "${var.bucket_name}-workspace-${terraform.workspace}"
  key          = "index.html"
  source       = "${path.module}/../shared/index.html"
  etag         = "${md5(file("${path.module}/../shared/index.html"))}"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "404" {
  bucket       = "${var.bucket_name}-workspace-${terraform.workspace}"
  key          = "404.html"
  source       = "${path.module}/../shared/404.html"
  etag         = "${md5(file("${path.module}/../shared/404.html"))}"
  content_type = "text/html"
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.my_route53_zone.zone_id}"
  name    = "website-${terraform.workspace}.${data.aws_route53_zone.my_route53_zone.name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_s3_bucket.b.website_endpoint}"]
}

# output "s3_website_endpoint" {
#   value = "${aws_s3_bucket.b.website_endpoint}"
# }

