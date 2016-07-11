# aws-ecs-elk
[![Build Status](https://travis-ci.org/dcrbsltd/aws-ecs-elk.svg?branch=master)](https://travis-ci.org/dcrbsltd/aws-ecs-elasticsearch)

A Dockerized elk stack, orchestrated via Amazon Web Services [CloudFormation](http://www.cloudsarelies.com.s3-website-eu-west-1.amazonaws.com/).

## Prerequisites
The scripts to run this CF template require

  * cURL
  * awscli

## Getting started
To create the stack in Amazon, copy the environment.variables.example to environment.variables, thusly

```
  cp environment.variables.example environment.variables
```

fill in the relavent details 
```
  #!/bin/bash
  # The uncommented variables 
  # are the bare minimum required to deploy this CF template

  # AWS Keys and Region
  export AWS_ACCESS_KEY_ID=
  export AWS_SECRET_ACCESS_KEY=
  export AWS_DEFAULT_REGION=eu-west-1

  # DNS Domain name which is also used as the Stack name
  export HOST=elk
  export DNS_DOMAIN=

  export KEY_NAME=elk

  # The port on the endpoint to test
  export PORT=5601

  # The VPC ID of the VPC
  export VPC_ID=

  # An email address for CloudFormation notifications
  export EMAIL=

  # The parameter values passed to the aws clouformation create command 
  PARAMETERS=ParameterKey=SSHLocation,ParameterValue="$IPADDRESS/32"
  PARAMETERS="${PARAMETERS} ParameterKey=KeyName,ParameterValue=$KEY_NAME"
  PARAMETERS="${PARAMETERS} ParameterKey=DNSDomain,ParameterValue=$DNS_DOMAIN"
  PARAMETERS="${PARAMETERS} ParameterKey=NotificationEmail,ParameterValue=$EMAIL"
  PARAMETERS="${PARAMETERS} ParameterKey=VpcId,ParameterValue=$VPC_ID"
```
and and run the command
```
  make install
```
or simply ```make```.

