provider "aws" {
  region = "us-east-1"
  # profile = "tyler"
}

data "aws_ami" "tf-ami" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {
  name = "us-east-1"
}

resource "aws_iam_role" "aws_access" {
  name = "awsrole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "my_inline_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          "Effect" : "Allow",
          "Action" : "ec2-instance-connect:SendSSHPublicKey",
          "Resource" : "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:instance/*",
          "Condition" : {
            "StringEquals" : {
              "ec2:osuser" : "ec2-user"
            }
          }
        },
        {
          "Effect" : "Allow",
          "Action" : "ec2:DescribeInstances",
          "Resource" : "*"
        }
      ]
    })
  }
        managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess", "arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/IAMFullAccess", "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"]

}

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "jenkins-profile"
  role = aws_iam_role.aws_access.name
}

resource "aws_instance" "tf-jenkins-server" {
  ami           = data.aws_ami.tf-ami.id
  instance_type = "t2.micro"
  key_name      = "aws"
  //  Write your pem file name
  security_groups = ["jenkins-server-sec-gr"]
  iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
  tags = {
    Name = "Jenkins_Server"
  }
  user_data = file("install-jenkins.sh")

}

resource "aws_security_group" "tf-jenkins-sec-gr" {
  name = "jenkins-server-sec-gr"
  tags = {
    Name = "jenkins-server-sec-group"
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}