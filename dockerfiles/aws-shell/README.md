## Docker aws-shell

Dockerised version of aws-shell tool, all images are rebuilt using latest alpine base on each new release to keep the image upto date.


Upstream: [https://github.com/awslabs/aws-shell](https://github.com/awslabs/aws-shell)

### Downloading

Pick a version you want to download for example 0.1.1

```
docker pull richarvey/aws-shell:0.1.1
or
docker pull richarvey/aws-shell:latest
```

see all tags at [https://hub.docker.com/r/richarvey/aws-shell/tags/](https://hub.docker.com/r/richarvey/aws-shell/tags/)

### Running

Run the container and map a local .aws files to the system to give it credentials

```
docker run -it -v `pwd`:/cfg -v ~/:/home/awsuser/ -v ~/.aws:/home/awsuser/.aws richarvey/aws-shell:${VERSION}
```

You can set an alias and then use awscli as normal if desired:

```
vi ~/.bash_profile
```

```
aws-shell() {
  docker run -it -v `pwd`:/cfg -v ~/:/home/awsuser/ -v ~/.aws:/home/awsuser/.aws --rm richarvey/aws-shell:latest;
}
```

### Get Releases

To add a new version edit the releases file


### Build the image

Build the docker images:

```
for rel in `cat releases`; do export shell_ver="${rel}" && docker build --build-arg SHELL_VERSION="${shell_ver}" -t "aws-shell:${shell_ver}" . ; done
```

