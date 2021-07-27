```
aws sts get-caller-identity --query Account --output text
```

`To Create Security Group`
```
aws ec2 create-security-group \
    --group-name roman_numbers_sec_grp \
    --description "This Sec Group is to allow ssh and http from anywhere"
```
`We can check the security Group with these commands`
```
aws ec2 describe-security-groups --group-names roman_numbers_sec_grp
```
`You can check IPs with this command`
```
curl https://checkip.amazonaws.com
```
`Create Security Group Rules`
```
aws ec2 authorize-security-group-ingress \
    --group-name roman_numbers_sec_grp \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress \
    --group-name roman_numbers_sec_grp \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0
```

`After creating security Groups, We'll create our EC2s. Latest AMI id should be used`

```
aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --region us-east-1
```
`To get latest AMI id`
```
aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text
```
`Assign a variable`
```
LATEST_AMI=ami-0dc2d3e4c0f9ebd18
```
`or we can assign a variable as below:`
```
LATEST_AMI=aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text

```

`create userdata.sh file`
```
#! /bin/bash
yum update -y
yum install python3 -y
pip3 install flask
cd /home/ec2-user
wget -P templates https://raw.githubusercontent.com/fatihtepe/my-projects/main/Project-001-Roman-Numerals-Converter/templates/index.html
wget -P templates https://raw.githubusercontent.com/fatihtepe/my-projects/main/Project-001-Roman-Numerals-Converter/templates/result.html
wget https://raw.githubusercontent.com/fatihtepe/my-projects/main/Project-001-Roman-Numerals-Converter/app.py
python3 app.py
```

`To run an instance`
```
aws ec2 run-instances \
    --image-id $LATEST_AMI \
    --count 1 \
    --instance-type t2.micro \
    --key-name aws \
    --security-groups roman_numbers_sec_grp \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=roman_numbers}]' \
    --user-data file:///Users/tepe/GitHub/my-projects/Project-001-Roman-Numerals-Converter/userdata.sh
```

`To see the each instances Ip we'll use describe instance CLI command`

```
aws ec2 describe-instances --filters "Name=tag:Name,Values=roman_numbers"
```
` You can run the query to find Public IP and instance_id of instances:`

```
aws ec2 describe-instances --filters "Name=tag:Name,Values=roman_numbers" --query 'Reservations[].Instances[].PublicIpAddress[]'
```

```
aws ec2 describe-instances --filters "Name=tag:Name,Values=roman_numbers" --query 'Reservations[].Instances[].InstanceId[]'
```
`To delete instances`
```
aws ec2 terminate-instances --instance-ids i-0b23ecb2a5039eae2
```
`To delete security groups`
```
aws ec2 delete-security-group --group-name roman_numbers_sec_grp
```


