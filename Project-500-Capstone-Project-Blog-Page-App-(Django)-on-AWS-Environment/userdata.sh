#!/bin/bash
apt-get update -y
apt-get install git -y
apt-get install python3 -y
cd /home/ubuntu/
TOKEN="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"
git clone https://$TOKEN@github.com/fatihtepe/tepe-aws-capstone.git
cd /home/ubuntu/tepe-aws-capstone
apt install python3-pip -y
apt-get install python3.7-dev libmysqlclient-dev -y
pip3 install -r requirements.txt
cd /home/ubuntu/tepe-aws-capstone/src
python3 manage.py collectstatic --noinput
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80