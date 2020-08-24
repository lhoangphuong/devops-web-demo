#!/bin/bash  
git add .  
read -p "Commit description: " desc  
git commit -m "$desc"  
git push origin master
curl "http://lhoangphuong.ddns.net:9292/job/hello-world/build?token=devops"