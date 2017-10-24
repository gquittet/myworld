# Configuration IPTables

## Installation

Copy the voidtables.rules to **/etc/iptables/**

## Start at startup

- Find the file *iptables.service* and change the script name inside.
- Next, enable it.

```bash
# systemctl start iptables.service
# systemctl enable iptables.service
```

## Restore iptables configuration

```bash
# iptables-restore < /etc/iptables/voidtables.rules
```

## Save iptables configuration
```bash
# iptables-save > /etc/iptables/voidtables.rules
```
