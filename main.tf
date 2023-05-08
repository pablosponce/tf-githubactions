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
  bucket = "tf-githubactions-labbcn-pablo"
}

resource "aws_s3_object" "object" {
  bucket  = aws_s3_bucket.c.bucket
  key     = "index.htm"
  content = "<html><head>Ejemplo de GitHub Action</head><body><p>Hola!</p></body></html>"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.c.id
  versioning_configuration {
    status = "Enabled"
  }
}
