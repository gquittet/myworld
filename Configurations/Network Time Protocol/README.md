# Network Time Protocol

Network Time Protocol is the most common method to synchronize the software clock of a GNU/Linux system with internet time servers. It is designed to mitigate the effects of variable network latency and can usually maintain time to within tens of milliseconds over the public Internet. The accuracy on local area networks is even better, up to one millisecond.

## NTP

### Installation

```
sudo pacman -S ntp
```

### Configuration

By default Arch add its own servers but it's better to use the NTP ones.

To do that, edit this file `/etc/ntp.conf`

To replace:

```
# Associate to Arch's NTP pool
server 0.arch.pool.ntp.org
server 1.arch.pool.ntp.org
server 2.arch.pool.ntp.org
server 3.arch.pool.ntp.org
```

With:

```
# Associate to Arch's NTP pool
server 0.pool.ntp.org
server 1.pool.ntp.org
server 2.pool.ntp.org
server 3.pool.ntp.org
#server 0.arch.pool.ntp.org
#server 1.arch.pool.ntp.org
#server 2.arch.pool.ntp.org
#server 3.arch.pool.ntp.org
```

### Knows bugs

#### IPv6

```
bind(24) AF_INET6 2a02:2788:15:f2b3:fbe1:5270:f6ff:6787#123 flags 0x11 failed: Cannot assign requested address
```

To fix this error, just start ntp with IPv4 only:
1. `# systemctl edit ntpd.service`
2. Paste the below content into this file
   
```
[Service]
ExecStart=
ExecStart=/usr/bin/ntpd -4 -g -u ntp:ntp
```

3. Save and reload the daemon with `# systemctl daemon-reload`


## Systemd-Timesync

`systemd-timesync` is a built-in small implementation of NTP inside Systemd.  
It's already installed. Nothing apart setup it.

### Configuration

1. Edit `/etc/systemd/timesyncd.conf`
2. Uncomment the `NTP=` line
3. Add these servers `NTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org`
4. Enable the service with `# systemctl enable systemd-timesyncd.service`
5. Start the service with `# systemctl start systemd-timesyncd.service`
6. Set ntp on with: `# timedatectl set-ntp true`

You can check the status of the configuration with:

```
$ timedatectl status
```

or to have more logs

```
$ timedatectl timesync-status
```
