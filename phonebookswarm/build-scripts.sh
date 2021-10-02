# Grand-Master
#! /bin/bash
yum update -y
hostnamectl set-hostname Grand-Master
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker swarm init
aws ecr get-login-password --region ${AWS::Region} | docker login --username AWS --password-stdin ${ECR_REGISTRY}
docker service create \
  --name=viz \
  --publish=8080:8080/tcp \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer
yum install git -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
yum install amazon-ecr-credential-helper -y
mkdir -p /home/ec2-user/.docker
cd /home/ec2-user/.docker
echo '{"credsStore": "ecr-login"}' > config.json
aws ecr create-repository \
    --repository-name ${APP_REPO_NAME} \
    --image-scanning-configuration scanOnPush=false \
    --image-tag-mutability MUTABLE \
    --region ${AWS::Region}
docker build --force-rm -t "${ECR_REGISTRY}/${APP_REPO_NAME}:latest" ${GITHUB_REPO}
docker push "${ECR_REGISTRY}/${APP_REPO_NAME}:latest"
mkdir -p /home/ec2-user/phonebook
cd /home/ec2-user/phonebook
cat << EOF | tee .env
ECR_REGISTRY=${ECR_REGISTRY}
APP_REPO_NAME=${APP_REPO_NAME}
EOF
curl -o "docker-compose.yml" -L https://raw.githubusercontent.com/callahan-cw/pro-203/master/docker-compose.yml
curl -o "init-db.py" -L https://raw.githubusercontent.com/callahan-cw/pro-203/master/init-phonebook-db.py
docker-compose config | docker stack deploy --with-registry-auth -c - phonebook && docker run --network phonebook_clarusnet -v /home/ec2-user/phonebook:/app python:alpine sh -c 'pip install mysql-connector-python &&  python /app/init-db.py'
- ECR_REGISTRY: !Sub ${AWS::AccountId}.dkr.ecr.${AWS::Region}.amazonaws.com
  APP_REPO_NAME: clarusway-repo/phonebook-app
  GITHUB_REPO: https://github.com/callahan-cw/pro-203.git
# New change 
curl -o "docker-compose.yml" -L ${GIT_FILE_URL}docker-compose.yml
curl -o "init.sql" -L ${GIT_FILE_URL}init.sql
docker-compose config | docker stack deploy --with-registry-auth -c - phonebook
- ECR_REGISTRY: !Sub ${AWS::AccountId}.dkr.ecr.${AWS::Region}.amazonaws.com
  APP_REPO_NAME: clarusway-repo/phonebook-app
  GITHUB_REPO: https://github.com/callahan-cw/203.git
  GIT_FILE_URL: https://raw.githubusercontent.com/callahan-cw/203/master/
# Manager Nodes
#! /bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
yum install python3 -y
pip3 install ec2instanceconnectcli
eval "$(mssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  \
  --region ${AWS::Region} ${DockerManager1} docker swarm join-token manager | grep -i 'docker')"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
yum install amazon-ecr-credential-helper -y
mkdir -p /home/ec2-user/.docker
cd /home/ec2-user/.docker
echo '{"credsStore": "ecr-login"}' > config.json

# Worker Nodes
#! /bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
yum install python3 -y
pip3 install ec2instanceconnectcli
eval "$(mssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  \
  --region ${AWS::Region} ${DockerManager1} docker swarm join-token worker | grep -i 'docker')"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
yum install amazon-ecr-credential-helper -y
mkdir -p /home/ec2-user/.docker
cd /home/ec2-user/.docker
echo '{"credsStore": "ecr-login"}' > config.json