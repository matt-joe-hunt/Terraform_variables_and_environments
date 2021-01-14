## Introduction

# Justification

I'm a firm believer that when learning a new technology that keeping things simple in the first instance is of paramount importance.  Frankly all the frilly bits can come later!

What I offer here is a basic example of deploying an AWS infrastructure using Terraform.  You can use this simple structure to deploy a simple EC2 instance with a VPC and attached Security Group.  With the configuration in this project, you should be able to quickly and easily make a secure connection to your Instance from the terminal.

In this example I have made use of a more complex way of defining the variables that I use within my deployment, we are using a *.tfvars* file as well as *.conf* files to allow us to pass in different variables depending upon which of our environments we are deploying too.

Do not expect this to be complete with all industry best practices, however if you are new to working with Terraform then this could be a good sample project to start with! My hope is that you will find some use in 'poking' this implementation to see how it works and changing it to see how it breaks. Below I will explain what some important sections of the code are doing so that you can start to build your own deployments.

## What is going on?

If you want to learn more about the individual resources that are being deployed here, you should look at this repo <<>>.

### configuration

### terraform.tfvars

### main.tf

In the root of the project we are declaring a variables like this:

```sh
vpc-name = var.vpc-name[terraform.workspace]
```

As we have declared our variables to be of type *map(string)* we have to select the key from which we want to retrieve a value.  We can do this by using the square brackets ( [] ) and the *terraform.workspace* inbuilt variable.  Depending upon which terraform workspace we are creating our deployment in, depends upon which set of variables we will be using!  So in order to use our 'dev' variables, we first need to run the command:

```sh
terraform workspace select dev || terraform workspace new dev
```

If we are happy with our deployment, and want to deploy it into our 'prod' environment, then running the command below will switch over to using the 'prod' variables.

```sh
terraform workspace select prod || terraform workspace new prod
```