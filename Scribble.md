## Scribble

#### Docker
* To get list of running docker containers: `docker ps`
* To SSH into a running docker container (first get container name by executing `docker ps`)
```
docker exec -it <container_name> /bin/bash
```

### NodeJS on Debian
* To uninstall currently installed version of NodeJS: `sudo apt-get remove nodejs`
* Refer following page to install NodeJS: https://github.com/nodesource/distributions#debinstall
    * Remeber to execute commands referenced in above link as root (or prefix commands with sudo)
