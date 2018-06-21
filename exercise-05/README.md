# Exercise 05

1. DNS time! With Route 53 of course. We want a domain for our awesome website. 
    * Since we already have the following hosted zone created and configured for  use, you can use it too:
````
data "aws_route53_zone" "my_route53_zone" {
  name = "awspoc.kresten-kjaer.dk"
}
````