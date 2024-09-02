resource "aws_instance" "server1" {
  ami    = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  key_name = "NA.pem"

  tags = {
    Name = "Terraform-ec2"
    Team = "Cloud"
    env = "dev"
    }
    user_data = file("code.sh")
}

resource "aws_security_group" "demo_sg" {
    name = "web-sg"
    #description = "allow ssh and httpd"

       /* ingress = {
            description = "allow ssh"
            form_port = 22
            to_port = 22
            protocol = "tcp"
           cidr_blocks = ["0.0.0.0/0"]

    }
    */
    egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
    description = "allow httpd"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
   }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
  
 output "public_ip" {
    value = aws_instance.server1.public_ip
 }
 output "az" {
    value = aws_instance.server1.availability_zone
 }
 output "ssh-command" {
    value = "ssh -i NA.pem ec2-user@${aws_instance.server1.public_ip}"
 }
    
    

    
    
  
