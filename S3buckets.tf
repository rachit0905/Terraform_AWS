#S3 bucket 
resource "aws_s3_bucket" "localmachinename" {
  bucket = var.s3_bucketname
}