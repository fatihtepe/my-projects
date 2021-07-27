```
aws sts get-caller-identity --query Account --output text
```


```
aws ec2 create-security-group \
    --group-name roman_numbers_sec_grp \
    --description "This Sec Group is to allow ssh and http from anywhere"
```
```
aws ec2 describe-security-groups --group-names roman_numbers_sec_grp
```

```
curl https://checkip.amazonaws.com
```

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