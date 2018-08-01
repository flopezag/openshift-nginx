# OpenShift NGINX
[![License badge](https://img.shields.io/badge/license-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Dockerfile description of the NGINX in order to install and configure FIWARE 
Wirecloud in OpenShift.

## Create the Docker Image

In order to create the proper image you need to have installed docker engine.
The first command is used to generate the docker image from the defined Dockerfile.

```
docker build -f Dockerfile -t flopez/nginx .
```

It creates the corresponding docker image tagged with flopez/nginx. The next step is
upload the image into a repository (in our case [Docker Hub](https://hub.docker.com/)).
We need to login into our user:

```
docker login
```

And them push the new created image into our repository

```
docker push flopez/nginx:latest
```

## OpenShift deployment

In order to deploy this image, just select the image name

```
docker.io/flopez/nginx:latest
```

And write the proper environment variable with the hostname of the Wirecloud service 
in order to use properly the component.

```
WIRECLOUD_SERVER = <hostname of wirecloud service>
```

Keep in mind that in OpenShift the hostname has the format:

```
<service name>.<project name>.svc
```

## License

These scripts are licensed under Apache License 2.0.
