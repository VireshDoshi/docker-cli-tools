#!/bin/bash
  echo "Getting all releases"
  curl https://api.github.com/repos/hashicorp/terraform/tags | jq -r .[].name | cut -d "v" -f 2 > releases
  curl https://api.github.com/repos/hashicorp/terraform/tags | jq -r .[].name | head -n1 | cut -d "v" -f 2 > latest
