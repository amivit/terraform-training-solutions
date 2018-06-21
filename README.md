# Book Club Workshop!

## What is Terraform?

Open-source software for having infrastructure as code (programatically plan, create, and destroy your stacks cloud infrastructure).

## Why?

* Automation.. Duh!
    * Won't have to remember every single step you took running around the Management Console getting things connected and working. It's already defined and automated in the code.
* Multiple environments ("workspaces")
  * Test your system in replica environments before production... Difficult to stay agile without constant testing.
* AWS works API first. So sometimes new features are available, but not via. Management Console. Terraform can be faster implementing the latest API's than the Management Console itself.
* Terraform aims to be cloud-provider agnostic. While a lot of your settings will likely be coupled to AWS specific details, *in theory* you should be able to more easily change your cloud provider.

## Alternatives?

There is CloudFormation, but Terraform seems to be superior in most scenarios. Generally readability & ease-of-use. Downsides? It feels a bit hacky when the software keeps waiting and polling as resources take time to spin up. As opposed to uploading a CloudFormation json in one go and waiting for AWS to report back.

# Terraform Concepts

To be talked about during our session:

* Configuration
    * Input Variables
    * Output Variables
* State
    * Remote State 
* Modules
* Workspaces

# Exercises

Start at exercise-01. All exercises will build on top of the previous. Have fun!

# Future Challenge

Use the Management Console as little as possible 😊 Automate all the things!