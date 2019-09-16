output "base_url" {
  value = "${aws_api_gateway_deployment.demogw.invoke_url}"
}

