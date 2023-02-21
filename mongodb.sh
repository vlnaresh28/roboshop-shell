source common.sh



print_head "Setup mongodb Repository"
cp configs/mongodb.repo   /etc/yum.repos.d/mongo.repo

print_head "Installaling MongoDB"
yum install mongodb-org -y 


print_head "Enable mongodb service"
systemctl enable mongod 


print_head "Started mongodb service "
systemctl start mongod 


#Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf

print_head "restart mongodb service"
systemctl restart mongod