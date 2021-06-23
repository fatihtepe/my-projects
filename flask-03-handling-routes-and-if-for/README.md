# Handling Routes and Templates with Flask Web Application and If and For Structure

- install Python and Flask framework on Amazon Linux 2 EC2 instance

- build a simple web application with Flask framework.

- understand the HTTP request-response cycle and structure of URL.

- create routes (or views) with Flask.

- serve static content and files using Flask.

- serve dynamic content using the html templates.

- write html templates using Jinja Templating Engine.

## Outline

- Getting to know routing and HTTP URLs.

- Write a Web Application using If conditions and for loops

- Write a Web Application with Sample Routings and Templating on GitHub Repo

- Install Python and Flask framework Amazon Linux 2 EC2 Instance and Run the Hello World App on EC2 Instance

## Getting to know routing and HTTP URLs.

HTTP (Hypertext Transfer Protocol) is a request-response protocol. A client on one side (web browser) asks or requests something from a server and the server on the other side sends a response to that client. When we open our browser and write down the URL (Uniform Resource Locator), we are requesting a resource from a server and the URL is the address of that resource. The structure of typical URL is as the following.

![URL anatomy](./url-structure.png)

The server responds to that request with an HTTP response message. Within the response, a status code element is a 3-digit integer defines the category of response as shown below.

- 1xx -> Informational

- 2xx -> Success

- 3xx -> Redirection

- 4xx -> Client Error

- 5xx -> Server Error

