resource "aws_key_pair" "saru" {
  key_name   = "saru-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpiMIXIXajTzffyecpDkepqo86ydcPkpksILaqjX3nMM6Fey9RxAZ+o/xjk2u7nR/gZ/5lSTgAUwmUHk9O8CbobcuDLNnuZD1LiyWmeshrhFyqwgpNtHR8X0lBVuYud0bU3jL8lM8JGaxip+dpd/wGWv4XnUF6Ji1BbLdXt2E3tsoebFBLhPjnqhbOjECs0GDnZLaadoT8UDduygghsu+n1gKHi8x3TiHpVgOUvTkzIyxJZjJcBT9LTMosMujhDFYJggA8JvvLTBvvEG1SnN2ZGMSoiu739dSg2TdmazUAmiGb2iEolJIeLIOlpXm//b091VhaxeV+xGP1ZIY7A7v+9jFIb0SfaCvMs992L1VmlRuUOmNAj8gY5DZTWue57A82XpnRS0maiX3qU4D0UsXx60K2zgsG12LD75r/p4UYDD050p6bn8o8EmKLwwQVl66K7w17qJ6xyH861CLLYVNsUUc2oRZBwAa5Ej5d1ZPZ/qRS8XBI110Z6T7SYvHPWaE= EPAM+Sarojini_Pasupuleti@EPINBANW0455"
}
resource "aws_instance" "apps" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = ["${aws_security_group.apps-sg.id}"]
  subnet_id              = aws_subnet.private-subnet-1.id
  key_name               = aws_key_pair.saru.id
    user_data = <<EOF
              #!/bin/bash
              yum update -y
              sudo amazon-linux-extras install nginx1
              systemctl start nginx1
              systemctl start nginx
              systemctl status nginx
              systemctl enable nginx
              echo "Hello World from" > /var/www/html/index.html

        EOF      

  tags = {
    Name = "apps"
  }

}

resource "aws_instance" "bastion" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = ["${aws_security_group.bastion-sg.id}"]
  subnet_id              =  aws_subnet.pub-subnet-2.id
  key_name              = aws_key_pair.saru.id
  #user_data              = file("install_nginx.sh")

  tags = {
    Name = "bastion"
  }

}


