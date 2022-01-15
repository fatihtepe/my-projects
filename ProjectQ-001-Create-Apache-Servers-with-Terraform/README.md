# ProjectQ-001: Create Apache Servers with Terraform

## Description:

- This project aims to create two apache servers in AWS with using Terraform to get the understanding to building infrastructure with Terraform.

## Problem Statement:

![Project_001](tf-draw.png)

- Your company has recently started a project that aims to deploy a website in Apache Servers. You and your colleagues have started to work on the project. Your Teammate have developed the website and they need your help to build infrastructure for deploying the website.

- The workflow steps for you is like below:

  - Scope: Confirm what resources need to be created for the project.

  - Author: Create the configuration file in HCL based on the scoped parameters.

  - Initialize: Run `terraform init` in the project directory with the configuration files. This will download the correct provider plug-ins for the project.

  - Plan & Apply: Run `terraform plan` to verify creation process and then `terraform apply` to create the resources in your configuration files.


- You are, as a cloud engineer, requested to create the Apache servers AWS EC2 Instance using Terraform to showcase your project. To do that you need to;

  - Get the bash script code from GitHub repo of your team.

  - Create two Apache Servers using the `main.tf`.

    - Create two ec2 instance

      - ami: Amazon Linux 2 (use data source to fetch the ami)

      - instance type: t2.micro

      - ec2 tags : "Name: Terraform First Instance",
                   "Name: Terraform Second Instance"

     - Install Apache server and start it. Write "Hello World" to the /var/www/html/index.html.

  - Create a Security Group and connect it to our instances.

    - inbound rules: open 22, 80 and 443 ports

    - outbound rules: open anywhere

  - Create a file name "public_ip.txt" and write your public ip's to the file.

  - Create a file name "private_ip.txt" and write your private ip's to the file.

  - Create an output in the terminal and display your public ip's when you create your infrastructure.


## Project Skeleton:

```text
001-creating-servers-with-tTerraform (folder)
|
|----readme.md          # Given to the students (Definition of the project)
|----create_apache.sh   # Given to the students (Bash Script)
|----main.tf            # To be delivered by students (Configuration File)
```

## Expected Outcome:

### At the end of the project, following topics are to be covered;

- Terraform

- Bash scripting

- AWS EC2 Service

- AWS Security Group Configuration

- Git & Github for Version Control System

### At the end of the project, students will be able to;

- configure Terraform to use AWS resources.

- write Terraform configuration file.

- Initialize Terraform in the current folder.

- Create resources running `terraform plan` and `terraform apply` commands.

- improve bash scripting skills using `user data` section in configuration file to install and setup web application on EC2 Instance

- configure AWS EC2 Instance and Security Groups.

- use git commands (push, pull, commit, add etc.) and Github as Version Control System.

## Steps to Solution:

- Step 1: Download or clone project definition from `clarusway-devops-8-21` repo on Github.

- Step 2: Create project folder for local public repo on your pc.

- Step 3: Prepare configuration file to create AWS EC2 instances and AWS Security Group.

- Step 4: Initialize Terraform in your current folder.

- Step 5: Run terraform commands (`terraform plan` and `terraform apply`) to create AWS resources.

- Step 6: Run `terraform destroy` command to destroy resources that you created with terraform.

## Notes:

- Use `user_data` argument with `file()` function in aws_instance resource block to install and start Apache server.

- Use `local-exec` provisioner to create `public_ip.txt` and `private_ip.txt`.

## Resources:

- [AWS Provider/Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
