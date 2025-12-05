#Private keys, dove-key and test-key files are not storing here in repo(me)
resource "aws_key_pair" "dove-key" {
  key_name   = "dove-key"
  public_key = "xxxxxxxxxx"
}

resource "aws_key_pair" "test-key" {
  key_name   = "test-key"
  public_key = "xxxxxxxxxx"
}
