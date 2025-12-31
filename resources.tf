
# Add a repositary  
resource "github_repository" "hello-first" {
  name        = "hellofirst"
  description = "My first repo from terraform"
  visibility  = "public"
  auto_init   = true

}

resource "github_repository" "hello-second" {
  name        = "hellosecond"
  description = "My first repo from terraform"
  visibility  = "public"
  auto_init   = true

}
#Key pair in order to attach to ec2 for SSH 

resource "aws_key_pair" "localmachinenamekeypair" {
  key_name   = "My_key_pair_terraform"
  public_key = file("${path.module}/id_rsa.pub") # reading the contents of the file
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

resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}




# AWS Resources EC2
resource "aws_instance" "name" {
  subnet_id              = var.subnet_id
  ami                    = var.amiid
  instance_type          = var.type
  key_name               = aws_key_pair.localmachinenamekeypair.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "MY-INSTANCE"
  }

}
#S3 bucket 
resource "aws_s3_bucket" "localmachinename" {
  bucket = var.s3_bucketname


}