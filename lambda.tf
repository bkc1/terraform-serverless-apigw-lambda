
resource "aws_lambda_function" "example" {
  function_name = "ServerlessExample"
  description   = " Terraform serverless project demo"

  # The bucket name as created earlier with "aws s3api create-bucket"
  s3_bucket = "${aws_s3_bucket.arifacts.id}"
  s3_key    = "${aws_s3_bucket_object.myartifact.id}"

  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "main.handler"
  runtime = "nodejs8.10"

  role = "${aws_iam_role.lambda_exec.arn}"
  # Ensure bucket is created and aftifact uploaded first
  depends_on = [ "aws_s3_bucket.arifacts", "aws_s3_bucket_object.myartifact" ]
}

# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role" "lambda_exec" {
  name = "serverless_example_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Allowing API Gateway to Access Lambda 
resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.example.arn}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_deployment.demogw.execution_arn}/*/*"
}

