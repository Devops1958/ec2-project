#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start
#sudo systemctl status
sudo systemctl enable
echo "<h1> this is deployed by Stephane!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "server1"{



  

