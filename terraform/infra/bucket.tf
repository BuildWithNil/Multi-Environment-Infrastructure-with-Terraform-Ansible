resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-nil-devops-bucket"
  tags = {
    Name        = "${var.env}-nil-devops-bucket"
    Environment = var.env
  }
  
}