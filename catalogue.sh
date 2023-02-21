
source common.sh

print_head "Download and install rpm files "
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${log_file}

print_head "Installaling nodejs "
yum install nodejs -y &>>${log_file}

print_head "created new user Roboshop"
useradd roboshop &>>${log_file}

print_head "Created application Directory "
mkdir /app &>>${log_file}

print_head "Removing Old Files "
rm -rf /app/* &>>${log_file}

print_head "Downloading artifacts"
curl -L -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>${log_file}

cd /app 
print_head "Extracting catalogue.zip file "
unzip /tmp/catalogue.zip &>>${log_file}

print_head "Installaling npm "
npm install &>>${log_file}

print_head "copy catalogue.service file "
cp ${code_dir}/catalogue.service /etc/systemd/system/catalogue.service &>>${log_file}



print_head "reloading demon file "
systemctl daemon-reload &>>${log_file}


print_head "enable catalogue "
systemctl enable catalogue &>>${log_file}


print_head "start catalogue service "
systemctl start catalogue &>>${log_file}



print_head "copy mongodb.repo file "
cp ${code_dir}/mongodb.repo /etc/yum.repos.d/mongo.repo &>>${log_file}

print_head "Installaling mongodb shell "
yum install mongodb-org-shell -y &>>${log_file}

print_head "Loading mongodb schema to catalogue.js file "
mongo --host mongodb.learndevopseasy.online </app/schema/catalogue.js &>>${log_file}
