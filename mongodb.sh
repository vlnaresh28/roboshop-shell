source common.sh



print_head "Setup mongodb Repository"
cp configs/mongodb.repo   /etc/yum.repos.d/mongo.repo &>>${log_file} 

print_head "Installaling MongoDB"
yum install mongodb-org -y &>>${log_file} 

print_head "Update MonogoDB Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>${log_file} 


print_head "Enable mongodb service"
systemctl enable mongod &>>${log_file} 


print_head "Started mongodb service "
systemctl start mongod &>>${log_file} 


#Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf

print_head "restart mongodb service"
systemctl restart mongod &>>${log_file} 