# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get stopped container processes
alias dpe="docker ps -f 'status=exited'"

# Get images
alias di="docker images"

# Get volumes
alias dv="docker volume"

# Get volumes list
alias dvl="docker volume ls"

# Get volumes list
dlogs() { docker logs $1; }

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Execute bash on a name container
dexb() { docker exec -it $1 bash; }

# Stop all containers
dstop() { docker stop $1; }

# Stop all containers
dstopa() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm -f $1; }

# Remove all containers
alias drma='docker rm $(docker ps -a -q);'

# Stop and Remove all containers
alias drmsa='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all stopped containers
alias drme='docker rm $(docker ps -f "status=exited" -q);'
drmd() { docker rm $(docker ps -f "status=exited" -q); }

# Remove all images
drmi() { docker rmi $(docker images -q); }

# Remove all <none> images
drmid() { docker rmi $(docker images -f "dangling=true" -q); }

# Remove all dangline volumes
drmvd() { docker volume rm $(docker volume ls -qf dangling=true); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
