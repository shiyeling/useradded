# The server side
## Grab a linux distro like fedora install pip and shadowsocks package
```bash
sudo dnf install python-setuptools
sudo easy_install pip
sudo pip install shadowsocks
```

## create a configuration for server

```json
{
	"server": "0.0.0.0",
		"timeout": 600,
		"method": "aes-256-cfb",
		"port_password": {
			"8000": "your password here"
		},
		"_comment": {
			"8000": "your comment here"
		},
	"method": "aes-256-cfb"
}

```

## for fedora, need to open up ports for firewalld

```bash
# get your zones
firewall-cmd --get-active-zones

# add port with below command, mind the zone name variable
firewall-cmd --zone=${zonename} --add-port=8300/tcp --permanent
firewall-cmd --reload
```

## Auto Start the ssserver on System Boot

You can create a Systemd unit file in /usr/lib/systemd/system/<service_name>.service. Here is a template:o

```bash
[Unit]
Description=<description_string>

[Service]
WorkingDirectory=<working_directory>
Type=forking
ExecStart=/bin/bash <absolute_path_to_script>
KillMode=process

[Install]
WantedBy=multi-user.target

#And use below command to add the service to auto start
systemctl enable <service_name>.service
```

used a simple script to start up the server

```bash
ssserver -c /etc/shadowsocks.json -d start -v --log-file /var/log/ssserver.log
```

# for the client side.
use sslocal to connect to server and provide socks5 proxy to local applications

## use the same approach to install shadowsocks packages on client machine

## create a configuration for client
put it as /etc/shadowsocks.json
```json
{
    "server":"server-ip",
    "server_port":8000,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"your-password",
    "timeout":600,
    "method":"aes-256-cfb"
}

```

## use the below command to start up the client

```bash
sudo sslocal -c /etc/shadowsocks.json -d start
```

## you could follow the same approach to set the client as service.
