resource "aws_key_pair" "instancekey" {
  key_name   = "instancekey"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "instancekey" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "instancekey"
    file_permission = 0400
}