#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start  
sudo systemctl enable httpd
echo "<h1>Welcome to Naresh IT</h1>" > /var/www/html/index.html

#git install
sudo yum install git -y