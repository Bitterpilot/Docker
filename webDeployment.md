# Simple docker based server

## load balancer nginx[^nginxSource]

accepts incoming on port 80 and routs them to continers ports

### Install nginx

```bash
sudo apt-get update

sudo apt-get install nginx
```

### Configure fire wall

We can list the applications configurations that ufw knows how to work with by typing:

```bash
sudo ufw app list
```

You should get a listing of the application profiles:

```bash
Output
Available applications:
  Nginx Full
  Nginx HTTP
  Nginx HTTPS
  OpenSSH
```

until all SSL certificats are set up allow http and then verify

```bash
sudo ufw allow 'Nginx HTTP'
sudo ufw status
```  

### Post install checks

check nginx is running post installation

```bash
systemctl status nginx
```

check that the server is actually serving pages
get the ip address

```bash
[[ $platform == 'linux' ]]; then
    export IP="$(ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//' | awk '!/[a-z]/')"
```

[^nginxSource]: [Nginx source](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-16-04)