# Exercise 06

## [Workspaces](https://www.terraform.io/docs/state/workspaces.html) are great!

Made for conveniently switching between multiple instances of a configuration (managing multiple states). The perfect solution for having different environments for the same configuration.

1. Create a new "staging" workspace and use that variable to setup a replica environment of your current stack, appending the workspace-name to the various ressources (especially the sub-domain).
2. Prove it works by being able to load xxxxxx-staging.kresten-kjaer.dk!