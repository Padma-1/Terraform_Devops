resource "aws_key_pair" "dove-key" {
  key_name = "dove-key"
  #ran ssh-keygen command from the same location of this file. Kept private key with me and public content in public_key argument value
  public_key = "xxxxx"
}
