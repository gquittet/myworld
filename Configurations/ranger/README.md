# Ranger: A python file manager

## How to install
Install the ranger package

## How to configure
Go to this folder

```
~/.config/ranger
```

And type this command

```bash
ranger --copy-config=all
```

Now you can put your configuration in these files:

- *rc.conf*: Startup commands and key bindings
- *commands.py*: Commands which are launched with :
- *rifle.conf*: Applications used when a given type of file is launched

## Example
I've added these lines to *rc.conf*

```
map cW bulkrename %s
```
