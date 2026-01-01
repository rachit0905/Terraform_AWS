#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
 
systemctl start nginx
systemctl enable nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Terraform Nginx Page</title>
</head>
<body>
    <h1>Hello from Nginx!</h1>
    <p>This page was deployed using Terraform + User Data.</p>
</body>
</html>
EOF


## confrigration management tool need for above part as 
##the user data goes out of terraform if any error occured we would not know 
##- ansible used