resource "aws_s3_bucket" "b" {
  bucket = "tf-actions-lab"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.b.bucket
  key    = "index.html"
  content = "Hola Mundo"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.b.id
  versioning_configuration {
    status = "Enabled"
  }
}

terraform {
       backend "remote" {
         # The name of your Terraform Cloud organization.
         organization = "momoconsulting"

         # The name of the Terraform Cloud workspace to store Terraform state files in.
         workspaces {
           name = "tf-githubactions"
         }
       }
     }
