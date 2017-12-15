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
map cd console mkdir%space
map cf console touch%space
```

### For picture rendering
I've added these lines to *rc.conf*
You need to install these packages: *w3m* and the w3m images support (*w3m-img*
for me)

```
set preview_images true
set preview_images_method w3m
```

## My folders mapping

```
map gdd cd ~/Documents
map gdw cd ~/Downloads
map gE cd ~/Documents/Ecole/HEH/BAC3
map gmm cd ~/.myworld
map gmw cd ~/.wallpapers
map gpp cd ~/Projets
map gpa cd ~/Projets/Android
map gpc cd ~/Projets/C
map gph cd ~/Projets/HTML
map gpj cd ~/Projets/Java
map gps cd ~/Projets/Spring
```
