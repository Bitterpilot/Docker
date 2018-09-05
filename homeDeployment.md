# install docker

```bash
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# ubuntu 16.04
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo docker run hello-world
# check https://github.com/docker/compose/releases for the most recent release
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker ${USER}
echo now make changes to /etc/environment
```

```bash
sudo nano /etc/environment
Add the following as separate lines at the end of the file:

PUID=1000
PGID=140
TZ="America/New_York"
CONTAINERDIR="/home/USER"
MYSQL_ROOT_PASSWORD="passsword"
```


https://forum.qnap.com/viewtopic.php?t=103684

## traefik loadbalancer
https://docs.traefik.io/user-guide/docker-and-lets-encrypt/

## intrest
https://www.reddit.com/r/homelab/comments/8zytby/containers_which_ones_do_you_run_at_home/