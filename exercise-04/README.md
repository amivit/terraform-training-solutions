# Exercise 04

Introducing the ability to split up your .tf-configs into multiple files and upload files to a S3 bucket.

1. Put your data and variable objects in their own .tf-files
    * You can have an unlimited amount of .tf files in a folder. Terraform will read them all.
2. Create some dummy index.html & 404.html
3. Have them uploaded to the bucket.
    * Hint 1: `aws_s3_bucket_object`
    * Hint 2: `content_type = "text/html"` (otherwise your browser will want to download the file instead of render it)
 4. Create an "[Output](https://www.terraform.io/intro/getting-started/outputs.html)" of the `website_endpoint`, and test that it works!
