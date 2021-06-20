# Creating First Flask Application - Hello World and basic usage of Jinja Templates

- Part 1 - Getting to know the Python Flask framework

- Part 2 - Write a Simple Hello World Web Application on GitHub Repo

- Part 3 - Write a Simple Hello World Web Application with Jinja template on GitHub Repo

- Part 4 - Install Python and Flask framework on Amazon Linux 2 EC2 Instance

## Part 1 - Getting to know the Python Flask framework

![Flask](./flask.png)

Flask is a web application development framework written in Python. It is a micro-framework that provides only the essential components which makes it easier to begin with when compared to full-stack frameworks like Django which has boilerplate code and dependencies.
And yet, Flask provides libraries, tools, and modules to develop web applications with additional features like authentication, database ORM, etc.

Followings are some of features of Flask Framework;

- It provides a development server and a debugger.

- It uses Jinja2 as templating engine.

- It is compliant with WSGI 1.0.

- It provides integrated support for unit testing.

- Many extensions are available to enhance its functionalities.


## Part 2 - Write a Simple Hello World Web Application on GitHub Repo


- Create a dynamic url which takes id number dynamically and return with a massage which show id of page.

- run the application in debug mode

- Connect the Hello World application from the web browser with `localhost:5000` or `127.0.0.1:5000`

- to reach application from anywhere on port 80, change debug mode

- Add and commit all changes on local repo

- Push `hello-world-app.py` to your remote repo


## Part 3 - Write a Simple Hello World Web Application with Jinja template on GitHub Repo

- run the application in debug mode

- Connect the Hello World application from the web browser with `localhost:5000` or `127.0.0.1:5000`

- Save the complete code as `jinja.py` file under `flask-02-Jinja_Template` folder.

- Add and commit all changes on local repo

- Push all files to your remote repo on GitHub.

## Part 4 - Run the Hello World App on EC2 Instance

- Launch an Amazon EC2 instance using the Amazon Linux 2 AMI with security group allowing SSH (Port 22) and HTTP (Port 80) connections.

- Connect to your instance with SSH.

- Update the installed packages and package cache on your instance.

- install git and wget

- Download the web application file from GitHub repo.

- Run the web application

- Connect the Hello World application from the web browser

- Connect the Hello World application from the terminal with `curl` command.
