This Terraform demo is built almost entirely from the tutorial below with the manual S3 resources automated via Terraform for demo purposes.

Terraform creates the buckets and uploads the ZIP artifact object.

Invoke Lambda manually
$ aws lambda invoke --region=us-west-2 --function-name=ServerlessExample

Test APIGW from the CLI:
$ curl https://s5dm1vailc.execute-api.us-west-2.amazonaws.com/test


Manually remove S3 object before destroying via Terraform(bucket name will differ)
$ aws s3 rm s3://lambda-arifiacts-549f3c73/v1.0.0/demo.zip
