# Exercise 03

## Introducing "[template_file](https://www.terraform.io/docs/providers/template/d/file.html)" and [S3 bucket creation as a static website hosting](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html)

Getting more difficult...

1. Create an S3 bucket configured as a website.
2. Upload a policy allowing the bucket to be publicly accessed.

The following policy can be saved as json and utilized:

```
{
    "Version": "2012-10-17",
    "Statement": [{
        "Sid": "PublicReadAccess",
        "Principal": {
            "AWS": "*"
        },
        "Effect": "Allow",
        "Action": [
            "s3:GetObject"
        ],
        "Resource": "arn:aws:s3:::${bucket}/*"
    }]
}
```