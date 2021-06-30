# Flask-04: Using Get-Post Methods

Purpose of the this project is to understand introductory knowledge of how to handle forms.

![HTTP Methods in Flask](./http-methods-flask.png)

## Outcomes

In this project, we will;

- install Python and Flask framework on Amazon Linux 2 EC2 instance.

- build a web application with Python Flask framework.

- handle forms using the flask-wtf module.

- use git repo to manage the application versioning.

- run the web application on AWS EC2 instance using the GitHub repo as codebase.


## Outline

- Part 1 - Getting to know HTTP methods (GET & POST).

- Part 2 - Learn to use GET and POST HTTP Method - 1

- Part 3 - Learn to use GET and POST HTTP Method - 2

- Part 4 - Write a Sample Web Application with forms and push to GitHub Repo

- Part 5 - Run the Sample Web Application on EC2 Instance


## Part 1 - Getting to know HTTP methods (GET & POST)


HTTP (Hypertext Transfer Protocol) is a request-response protocol. A client on one side (web browser) asks or requests something from a server and the server on the other side sends a response to that client. 

When sending request, the client can send data with using different http methods like `GET, POST, PUT, HEAD, DELETE, PATCH, OPTIONS`, but the most common ones are `GET` and `POST`.

![Get and Post Requests](./get-post-request.jpg)

- HTTP `GET` method request;
    
    - used to request data from a specified resource.

    - can be cached.

    - remains in the browser history.

    - can be bookmarked

    - should never be used when dealing with sensitive data.

    - has length limitation.

    - only used to request data, not to modify it. 

    ![url-structure of GET method](./url-structure.png) 

- HTTP `POST` method request;
    
    - never cached.

    - does not remain in the browser history.

    - can not be bookmarked

    - can be used when dealing with sensitive data.

    - has no length limitation.

