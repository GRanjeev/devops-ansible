provider "aws" {
region = "ap-south-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-041d6256ed0f2061c"
  instance_type = "t2.micro"
  key_name = "terra1"

  tags = {
    Name = "Greeshma-devops-ec2-instance"
    env = "prod"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /root/inv"
  }
}

