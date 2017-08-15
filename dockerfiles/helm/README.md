## Docker helm

Dockerised version of helm, all images are rebuilt using latest alpine base on each new release to keep the image upto date.

### Downloading

Pick a version you want to download for example v2.5.1

```
docker pull richarvey/helm:v2.5.1
```

see all tags at [https://hub.docker.com/r/richarvey/helm/tags/](https://hub.docker.com/r/richarvey/helm/tags/)

### Running

Run the container and map a local .aws files to the system to give it credentials

```
docker run -it -v `pwd`:/cfg -v ~/.aws:/home/awsuser/.aws richarvey/helm:${VERSION} ${COMMAND}
```

You can set an alias and then use helm as normal if desired:

```
vi ~/.bash_profile
```

```
helm() {
  docker run -it -v `pwd`:/cfg -v ~/.aws:/home/awsuser/.aws --rm richarvey/helm:v2.5.1 "$@";
}
```

### Get Releases

To add a new version edit the releases file


### Build the image

Build the docker images:

```
for rel in `cat releases`; do export helm_ver="${rel}" && docker build --build-arg HELM_VERSION="${helm_ver}" -t "helm:${helm_ver}" . ; done
```
