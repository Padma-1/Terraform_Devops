resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiID.id #required argument unless launch_template is specified
  instance_type          = "t3.micro"            #required argument unless launch_template is specified
  key_name               = "dove-key"            #the key name we gave in keypair.tf, else we can refer it as aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = "us-east-1a"

  tags = {
    Name    = "Dove-web"
    Project = "Dove"
  }
}

output my_instance_id{
    value = aws_instance.web.id
}
