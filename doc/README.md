# Quick reference

-	**Where to get help**:  
	[the Docker Community Forums](https://forums.docker.com/), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack/), or [Stack Overflow](https://stackoverflow.com/search?q=fiware-wirecloud)

-	**Where to file issues**:  
	[https://github.com/flopezag/openshift-nginx/issues](https://github.com/flopezag/openshift-nginx/issues)

-	**Maintained by**:  
	[the NGINX Docker Maintainers](https://github.com/flopezag/openshift-nginx)

-	**Source of this description**:  
	[docs repo's `nginx/` directory](https://github.com/flopezag/openshift-nginx/docs/tree/master/nginx) ([history](https://github.com/flopezag/openshift-nginx/docs/commits/master/nginx))

-	**Supported Docker versions**:  
	[the 18.06.0-ce release](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce) 
	(down to 18.06.0-ce on a best-effort basis)

# What is this nginx image

This docker image has been generated in order to work with [FIWARE Wirecloud](https://hub.docker.com/r/fiware/wirecloud/) 
and installed with unprivileged status in order to deploy it in OpenShift. For that 
purpose, it is needed to define the hostname of the corresponding FIWARE Wirecloud 
instance in the OpenShift environment to be used. 

# How to use this image

## Hosting a simple docker service locally

In order to create the proper image just execute:

```console
docker build -f Dockerfile -t flopez/nginx:latest $PWD
```

Just the next step is to upload the image to the current repository:

```console
docker push flopez/nginx:latest
```

Alternatively, to run this docker image just execute the following commands:

```console
docker run --name <some container name> -e WIRECLOUD_SERVER=<hostname of wirecloud server> <docker image ID>
```

This will create a container listening on port 8080 and connected to the service
*wirecloud.fiware-certification.svc*.

## OpenShift deployment

It is possible to deploy this docker image inside a OpenShift instance, just 
selecting deploy image and specifying the proper Image Name. In this case,
the value of the Image name or pull spec is **docker.io/flopez/nginx:latest**


### Using environment variables in nginx configuration

There is a environment variable that has to be defined when we deploy this 
image. Here is an example using docker-compose.yml:

```yaml
web:
  image: nginx
  ports:
   - "8080:8080"
  environment:
   - WIRECLOUD_SERVER=<hostname of wirecloud server>
```

# License

View [license information](http://nginx.org/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under 
other licenses (such as Bash, etc from the base distribution, along with any direct or 
indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that 
any use of this image complies with any relevant licenses for all software contained 
within.

For the additional configuration content defined in this repo, view license information contained in the
repository [license information](https://github.com/flopezag/openshift-nginx/blob/master/LICENSE).