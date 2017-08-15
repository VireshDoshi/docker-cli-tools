## Docker Terraform

Dockerised version of vault, all images are rebuilt using latest alpine base on each new release to keep the image upto date.

### Downloading

Pick a version you want to download for example 0.7.3 

```
docker pull richarvey/vault:0.7.3
```

see all tags at [https://hub.docker.com/r/richarvey/vault/tags/](https://hub.docker.com/r/richarvey/vault/tags/)

### Running

Run the container and map a local .aws file to the system to give it credentials and expose the working diectory to the tool

```
docker run -it -v ~/.aws:/home/vaultuser/.aws -v `pwd`:/cfg richarvey/vault:${VERSION} ${VAULT_COMMAND}
```

You can set an alias and then use vault as normal if desired:

```
vi ~/.bash_profile
```

```
vault() {
  docker run -it -v ~/.aws:/home/vaultuser/.aws -v `pwd`:/cfg --rm richarvey/vault:latest "$@";
}
```

### Get Releases

To add a new version and update old versions base image first run:

```
./get-releases.sh
```

Flags that you can add to the script

 - latest :- just gets the latest tag
 - 0.7.3 :- check a specific version
 - all :- gets all releases including the beta, alpha and rc releases

### Build the image

Build the docker images:

```
for rel in `cat releases`; do export vault_ver="${rel}" && docker build --build-arg VAULT_VERSION="${vault_ver}" -t "vault:${vault_ver}" . ; done
```
