## Docker awscli

Dockerised version of awscli, all images are rebuilt using latest alpine base on each new release to keep the image upto date.

### Downloading

Pick a version you want to download for example 1.11.124

```
docker pull richarvey/awscli:1.11.124
```

see all tags at [https://hub.docker.com/r/richarvey/awscli/tags/](https://hub.docker.com/r/richarvey/awscli/tags/)

### Running

Run the container and map a local .aws files to the system to give it credentials

```
docker run -it -v `pwd`:/cfg -v ~/.aws:/home/awsuser/.aws richarvey/awscli:${VERSION} ${COMMAND}
```

You can set an alias and then use awscli as normal if desired:

```
vi ~/.bash_profile
```

```
aws() {
  docker run -it -v `pwd`:/cfg -v ~/.aws:/home/awsuser/.aws --rm richarvey/awscli:latest "$@";
}
```

### Get Releases

To add a new version edit the releases file


### Build the image

Build the docker images:

```
for rel in `cat releases`; do export cli_ver="${rel}" && docker build --build-arg CLI_VERSION="${cli_ver}" -t "awscli:${cli_ver}" . ; done
```


