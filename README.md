## Docker(ised) CLI tools

Dockerised version of tools for running frameworks and cli tools on any machine easily.

### Git repository

There is a new unified git repository found here:

[https://github.com/richarvey/docker-cli-tools](https://github.com/richarvey/docker-cli-tools)

**NOTE:** Please track issues and requests on Github.

### Tools

- awscli
- aws-shell
- helm
- kubectl
- serverless (framework)
- terraform
- vault

### Downloading

Pick a version you want to download for example 1.11.124

```
docker pull richarvey/<TOOL_NAME>:1.11.124
```

### Running

```
source /path_to_/bash_clitools
```

Then run the tool as normal eg:

```
terraform plan
```

