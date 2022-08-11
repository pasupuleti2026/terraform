resource "aws_s3_bucket" "first-demo-1234" {
  
  bucket = "my-tf-test-bucket-1234560987"
             
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "first-demo-5678" {
  
  bucket = "saru-6789"
             
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "first-demo-3456" {
  
  bucket = "saru-1234"
             
  acl    = "private"

  versioning {
    enabled = true
  }
}
