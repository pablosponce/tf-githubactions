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


resource "aws_s3_bucket" "c" {
  bucket = "tf-githubactions-lab-pablo"
}

resource "aws_s3_object" "object" {
  bucket  = aws_s3_bucket.c.bucket
  key     = "index.html"
  content = "Hola!"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.c.id
  versioning_configuration {
    status = "Enabled"
  }
}
