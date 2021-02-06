# ScaleReal

## Module Description

* API_Gateway: 
This help in creation of an Authenticated(token based) Rest API endpoints through API Gateway that is attached to Lamdba function which does CRUD on the records stored in DynamoDB after CSV file upload.

* DynamoDB: 
Creates the table that stores the data from CSV file.

* Lambda: 
Setup a lambda that gets triggered on file upload to the the s3 bucket and reads the uploaded CSV file.

* Role: 
It comprise up of a an IAM role for attchaching to the lambda function with S3 and Dynamodb.

* S3: 
This module determines the S3 bucket that we will be using and the notify the lambda trigger.

## Run the commands in Dev environment
```
 aws s3api create-bucket --bucket=scalereal-devopstest --region=us-east-2 //Manual step for creating the S3 bucket 
 git clone <https://github.com/prachijain11/ScaleReal.git>
 cd /ScaleReal/DEV
 terraform init
 terraform plan -var-file="terraform.tfvars"
 terraform apply -var-file="terraform.tfvars"
 terraform destroy -var-file="terraform.tfvars"
```
