provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIASHAXUDD63VBGXTEL"
  secret_key = "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"
}
resource "aws_instance" "myinstance" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"
  key_name      = "pswain"
  tags = {
    name = "TF-DemoServer"
  }
}
