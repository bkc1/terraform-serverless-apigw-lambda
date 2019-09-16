# Terraform Serverless Application with Lambda & API GW


## Overview

This Terraform example was built almost entirely from the tutorial below with the manual S3 resources automated via Terraform for demo purposes.

https://learn.hashicorp.com/terraform/aws/lambda-api-gateway

Terraform creates the buckets and uploads the ZIP artifact object.

The API GW invoke endpoint is in the Terraform outputs for convienence.

## CLI reference

Invoke Lambda manually

```$ aws lambda invoke --region=us-west-2 --function-name=ServerlessExample```

Test APIGW from the CLI:

```$ curl https://s5dmXXXXXX.execute-api.us-west-2.amazonaws.com/test```

Manually remove S3 object before destroying via Terraform

```$ aws s3 rm s3://lambda-arifiacts-XXXXX/v1.0.0/demo.zip```
