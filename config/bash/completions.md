To add completions download the files and copy them to /etc/bash_completions.d/ .
Command to download all of them:  
- fish: `for i in (awk -F ';' '{print $2}' completions | tr -d " "); if ! [ -z $i ]; echo $i; wget $i; end; end`
- bash: `for i in $(awk -F ';' '{print $2}' completions | tr -d " "); do if ! [ -z $i ]; then echo $i; wget $i; fi; done`

List of completions and where to download them:
- docker-compose; https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose
- docker; https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker

