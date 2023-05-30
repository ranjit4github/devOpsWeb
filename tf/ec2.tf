provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAVNW7YNJHNIJOMIFZ"
  secret_key = "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"
}
resource "aws_instance" "myinstance" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"
  key_name      = "kswain"
  tags = {
    name = "TF-DemoServer"
  }
}
