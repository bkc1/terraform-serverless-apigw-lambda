resource "random_id" "mybucket1" {
  byte_length = 4
}

resource "aws_s3_bucket" "arifacts" {
  bucket   = "lambda-arifiacts-${random_id.mybucket1.hex}"
}

resource "aws_s3_bucket_object" "myartifact" {
  bucket = "${aws_s3_bucket.arifacts.id}"
  key    = "v1.0.0/demo.zip"
  source = "demo.zip"
}

