# Book Club Terraform Workshop

## What is Terraform?

Open-source software for having infrastructure as code (programatically plan, create, and destroy your stacks cloud infrastructure).

## Why?

* Automation.. Duh!
    * Won't have to remember every single step you took running around the Management Console getting things connected and working. It's already defined and automated in the code.
* Multiple environments ("workspaces")
  * Be more flexible spinning up environments for testing before production...
* Traceability
    * Track changes to the evolving infrastructure as the config evolves.
* Amazon develops AWS API first. So sometimes new features are available, but not via. Management Console. Terraform can be faster implementing the latest API's than the Management Console itself.
* Terraform aims to be cloud-provider agnostic. While a lot of your settings will likely be coupled to AWS specific details, *in theory* you should be able to more easily change your cloud provider.

For application stacks looking very static, maybe not always the best ROI, but should at least be considered! Not difficult once you're started...

## Alternatives?

There is CloudFormation, but Terraform seems to be superior in most scenarios. General readability & ease-of-use. Downsides? It feels a bit hacky when the software keeps waiting and polling as resources take time to spin up. As opposed to uploading a CloudFormation json in one go and waiting for AWS to report back.

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

Start at exercise-01. All exercises will build on top of the previous. Solutions in the solution folder if stuck. Have fun!

# Future Challenge

Use the Management Console as little as possible 😊 Automate all the things!

# Additional reading...

[Terraform Gotchas and How We Work Around Them](http://heap.engineering/terraform-gotchas/) - [hackernews thread](https://news.ycombinator.com/item?id=14539814)

