resource "aws_key_pair" "cmtr-g40pyt8i-keypair" {
  key_name   = "cmtr-g40pyt8i-keypair"
  public_key = var.ssh_key

  tags = {
    Project = "epam-tf-lab"
    ID      = "cmtr-g40pyt8i"
  }
}