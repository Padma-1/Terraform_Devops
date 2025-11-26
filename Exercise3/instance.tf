resource "aws_instance" "web" {
  ami                    = var.amiID[var.region] #so it will take amiID of us-east-1 from variables.tf
  instance_type          = "t3.micro"            #required argument unless launch_template is specified
  key_name               = "dove-key"            #the key name we gave in keypair.tf, else we can refer it as aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = var.zone1

  tags = {
    Name    = "Dove-web"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("dove-key") #here we can directly mention the generated private key, else can use file function by keeping the private key path (in github I'm not pushing the private key)
    host        = self.public_ip   #gets the public ip of creating instance
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  # to store the value in a file in local using local-exec (copied the generated output file also into github)
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}

#if we terminate any resource from console, terraform plan/apply detect that change but
#This allows managing an instance power state. If an instance is stopped, without this below resource terraform plan/apply won;t detect the change.
resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}

output "my_instance_id" {
  value = aws_instance.web.id
}
