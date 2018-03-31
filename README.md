CI/CD Jenkins
=============

Its a dummy project to test how to create continous integration and continous delivery using 5 technologies:

- Git as a version control system.
- Node (as a stand alone server).
- Docker as a containerization tool to be able to scale the application.
- Jenkins as a Testing and deployment tool.
- Google Cloud as a cloud compute engine.



## Docker

Create a docker container, install all dependencies and build the project.

* To create the docker image
```
$ docker build -t moriorgames/node-server .
```

* Run the container
```
$ docker run -td --name node_server -p 8000:8000 moriorgames/node-server
```

* Test the program
```
$ docker exec -ti node_server npm test
```

## Docker Images

I like to preserve information about tagging and pushing imageFile to docker

* First login at dockerhub
```
$ docker login
username
password
```

* Tag an existing image
```
$ docker tag moriorgames/node-server docker.io/moriorgames/node-server:commit_sha
$ docker tag moriorgames/node-server docker.io/moriorgames/node-server:latest
```

* Push the image to the public repository
```
$ docker push moriorgames/node-server:commit_sha
$ docker push moriorgames/node-server:latest
$ docker push docker.io/moriorgames/node-server:latest
```
