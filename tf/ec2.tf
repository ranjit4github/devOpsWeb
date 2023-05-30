provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAVNW7YNJHHLJMA2Y4"
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
