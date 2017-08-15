## Docker Terraform

Dockerised version of terraform, all images are rebuilt using latest alpine base on each new release to keep the image upto date.

### Downloading

Pick a version you want to download for example 0.9.11 

```
docker pull richarvey/terraform:0.9.11
```

see all tags at [https://hub.docker.com/r/richarvey/terraform/tags/](https://hub.docker.com/r/richarvey/terraform/tags/)

### Running

Run the container and map a local .aws file to the system to give it credentials and expose the working diectory to the tool

```
docker run -it -v ~/.aws:/home/terraformuser/.aws -v `pwd`:/cfg richarvey/terraform:${VERSION} ${TERRAFORM_COMMAND}
```

You can set an alias and then use terraform as normal if desired:

```
vi ~/.bash_profile
```

```
terraform() {
  docker run -it -v ~/.aws:/home/terraformuser/.aws -v `pwd`:/cfg --rm richarvey/terraform:0.9.11 "$@";
}
```

### Get Releases

To add a new version and update old versions base image first run:

```
./get-releases.sh
```

Flags that you can add to the script

 - latest :- just gets the latest tag
 - 0.9.11 :- check a specific version
 - all :- gets all releases including the beta, alpha and rc releases

### Build the image

Build the docker images:

```
for rel in `cat releases`; do export terraform_ver="${rel}" && docker build --build-arg TERRAFORM_VERSION="${terraform_ver}" -t "terraform:${terraform_ver}" . ; done
```
