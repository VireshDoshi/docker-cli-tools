## Docker kubectl

Dockerised version of kubectl, all images are rebuilt using latest alpine base on each new release to keep the image upto date.

### Downloading

Pick a version you want to download for example v1.6.2 or use latest

```
docker pull richarvey/kubectl:v1.6.2
```

see all tags at [https://hub.docker.com/r/richarvey/kubectl/tags/](https://hub.docker.com/r/richarvey/kubectl/tags/)

### Running

Run the container and map a local .kube file to the system to give it credentials

```
docker run -it -v `pwd`:/cfg -v ~/.kube:/home/kubeuser/.kube richarvey/kubectl:${VERSION} ${KUBECTL_COMMAND}
```

You can set an alias and then use kubectl as normal if desired:

```
vi ~/.bash_profile
```

```
kubectl() {
  docker run -it -v `pwd`:/cfg -v ~/.kube:/home/kubeuser/.kube --rm richarvey/kubectl:v1.7.2 "$@";
}
```

### Get Releases

To add a new version and update old versions base image first run:

```
./get-releases.sh
```

Flags that you can add to the script

 - latest :- just gets the latest tag
 - v1.6.2 :- check a specific version
 - all :- gets all releases including the beta, alpha and rc releases

### Build the image

Build the docker images:

```
for rel in `cat releases`; do export k8s_ver="${rel}" && docker build --build-arg KUBECTL_VERSION="${k8s_ver}" -t "kubectl:${k8s_ver}" . ; done
```
