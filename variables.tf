variable "aws_region" {
 type=string
 default="eu-north-1"
}

variable "aws_key" {
 type=string
 default="${{ secrets.AWS_KEY }}"
}

variable "aws_secret" {
 type=string
 default="${{ secrets.AWS_SECRET }}"
}
