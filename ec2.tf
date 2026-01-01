# AWS Resources EC2
resource "aws_instance" "name" {
  subnet_id              = var.subnet_id
  ami                    = var.amiid
  instance_type          = var.type
  key_name               = aws_key_pair.localmachinenamekeypair.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    user_data                   = file("${path.module}/userdata.sh")
  user_data_replace_on_change = true
    

  tags = {
    Name = "MY-INSTANCE"
  }

}


# data "aws_subnet" "default" {
#   default_for_az = true
#   availability_zone = "ap-south-1a"
# }

# resource "aws_instance" "ec2" {
#   ami           = "ami-0f5ee92e2d63afc18"
#   instance_type = "t2.micro"
#   subnet_id     = data.aws_subnet.default.id

#   vpc_security_group_ids = [
#     aws_security_group.ssh_sg.id
#   ]
# }