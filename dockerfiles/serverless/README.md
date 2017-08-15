## Docker serverless

Dockerised version of serverless, all images are rebuilt using latest alpine base on each new release to keep the image upto date.

### Downloading

Pick a version you want to download for example 1.18.1

```
docker pull richarvey/serverless:1.18.1
```

see all tags at [https://hub.docker.com/r/richarvey/serverless/tags/](https://hub.docker.com/r/richarvey/serverless/tags/)

### Running

Run the container and map a local .aws files to the system to give it credentials

```
docker run -it -v `pwd`:/cfg -v ~/.aws:/home/serverlessuser/.aws richarvey/serverless:${VERSION} ${COMMAND}
```

You can set an alias and then use serverless as normal if desired:

```
vi ~/.bash_profile
```

```
serverless() {
  docker run -it -v `pwd`:/cfg -v ~/.aws:/home/serverlessuser/.aws --rm richarvey/serverless:1.18.1 "$@";
}
```

### Get Releases

To add a new version edit the releases file


### Build the image

Build the docker images:

```
for rel in `cat releases`; do export serverless_ver="${rel}" && docker build --build-arg SERVERLESS_VERSION="${serverless_ver}" -t "serverless:${serverless_ver}" . ; done
```
