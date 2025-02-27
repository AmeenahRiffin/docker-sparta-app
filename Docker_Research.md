# Docker Research

## Day 1 Research

### What is Docker?

Docker is a containerization platform that allows developers to package and run applications in isolated environments, making it easier to deploy and manage software. It's similar to a software I've used in the past called XAMPP, but it is more advanced and has a more user-friendly interface.

### What is a Container?

A container is a standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries, and settings. It has it's own filesystem that is isolated from the host machine. 

It's like a virtual machine, but it's much more lightweight and efficient.

I noted the differences between images and containers in docker (containers are read-write, images are read-only - images are built in Docker to make containers).

### Microservices

Microservices are a design pattern that allows you to divide a monolithic application into smaller, independent services that can be scaled and deployed independently. This makes it easier to manage and maintain the application.

## Day 2 Research

### Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. It uses a YAML file to configure the services, networks, and volumes that the containers need to run.