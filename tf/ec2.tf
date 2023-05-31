provider "aws" {
  region     = "ap-south-1"
}
resource "aws_instance" "myinstance" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"
  key_name      = "kswain"
  tags = {
    name = "TF-DemoServer"
  }
 provisioner "local-exec" {
   command = "echo ${aws_instance.myinstance.public_ip} >> /etc/ansible/hosts"
  }

}
