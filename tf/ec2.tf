provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAVNW7YNJHE4GUXTHS"
  secret_key = "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"
}
resource "aws_instance" "myinstance" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"
  key_name      = "kswain"
  tags = {
    name = "TF-DemoServer"
  }
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  
  provisioner "local-exec" { 
   command = "echo [webserver] > /etc/ansible/hosts ; echo ${aws_instance.myinstance.public_ip} >> /etc/ansible/hosts"
  }

}
