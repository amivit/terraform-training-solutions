# Intro

We will start slow but eventually have a Terraform-configuration capable of setting up a static website on S3 with Route 53 dns configuration in different environments, depending on your "workspace". 

Cherish the [docs](https://www.terraform.io/docs/configuration/index.html), as they are well written and contain everything we need!


## Exercise 01

1. Get an EC2 instance up and running in AWS! Any AMI.
2. Try changing any detail, such as the tag "Name" or the instance size, and apply the changes. 
    * Notice how Terraform detects the necessary changes necessary to apply? 
    * **Let's talk about state.**
4. Destroy it 🔥

Key Terraform commands :

1. `terraform init`
2. `terraform plan`
3. `terraform apply`
4. `terraform destroy`