
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


# ##Creating Security Grp 
# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls_terraform"
#   description = "Allow TLS inbound traffic and all outbound traffic"

#   tags = {
#     Name = "allow_tls"
#   }
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