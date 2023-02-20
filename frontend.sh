code_dir=${pwd}
echo -e "\e[33m Installaling Nginx\e[0m"
yum install nginxx -y 

echo -e "\e[32m Removing Old Content\e[0m"
rm -rf /usr/share/nginx/html/* 

echo -e "\e[35m Downloading Frontend Content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 

echo -e "\e[35m Extracting Downloaded Frontend\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip 

echo -e "\e[35m Copying Nginx Config for RoboShop\e[0m "
cp ${code_dir}/configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf 

echo -e "\e[35m Enabling nginx \e[0m "
systemctl enable nginx

echo -e "\e[36m reStarting nginx \e [0m "
systemctl restart nginx 



## If any command is errored or failed, we need to stop the script
# Status of a command need to be printed.