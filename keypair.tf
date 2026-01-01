#Key pair in order to attach to ec2 for SSH 

resource "aws_key_pair" "localmachinenamekeypair" {
  key_name   = "My_key_pair_terraform"
  public_key = file("${path.module}/id_rsa.pub") # reading the contents of the file
}

