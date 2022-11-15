# Instance creation

resource "aws_instance" "wordpress-lamp" {
  ami                    = data.aws_ami.ubuntu_latest.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-http.id]
  key_name               = aws_key_pair.instancekey.key_name
  tags = {
    Name = "valters-intance"
  }
  provisioner "local-exec" {
    command = "sleep 40; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ~/home/Ansible-Wordpress/instancekey -i '${aws_instance.wordpress-lamp.public_ip},' ./playbook.yaml"
  }
}