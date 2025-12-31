output "Github_firstrepoURL" {
  value = github_repository.hello-first.html_url
}

output "Github_secondrepoURL" {
  value = github_repository.hello-second.html_url
}

output "printing" {
  value = "My name is ${var.username} my age is ${var.age} and live in ${var.city}"

}

output "aws_printing" {
  value = "Created a ${var.type} instance ${var.amiid}"
}

output "aws_s3_bucket_printing" {
  value = "This is the S3 bucket ${var.s3_bucketname} arn is ${aws_s3_bucket.localmachinename.arn}"
}

output "keypair" {
  value = "Key pair name is  ${aws_key_pair.localmachinenamekeypair.key_name}"
}