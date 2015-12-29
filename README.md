# Here is  my Tmux and Vim configuration
### Only for Debian and Ubuntu users

## First of all : switch caps lock to escape
Only for GNU/Linux computers

    gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

To revert this :

    gsettings set org.gnome.desktop.input-sources xkb-options []

## To complete your VIM configuration
You must do in VIM :

    :PluginInstall

In a terminal :

    sudo apt-get install vim-youcompleteme
    cd ~
    mkdir ycm_build
    cd ycm_build
    cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    cmake --build . --target ycm_support_libs --config Release
    cd ~
    rm -rf ycm_build

## My shorcuts used in Vim

> What is the mapleader key in my configuration ?

    <Leader> = ,

### Control the buffer
    <Leader>bn : Switch to the next buffer
    <Leader>bp : Switch to the previous buffer
    <Leader>bf : Switch to the first buffer
    <Leader>bd : Delete the current buffer

### CTags

> What is the shortcut key ?

    <Leader>tt

> Ctags doesn't work

*It's normal because you need to install the exuberant-ctags package.*

### Take the control over your git files
    <Leader>gs : Show the current status of your git repository
    <Leader>ga : Add all the files to your git repository
    <Leader>gc : Send the commit
    <Leader>gp : Push all the files that were added before


### Emmet
> What is the shortcut key ?

> In insert mode

    <C-y>, : Execute emmet

Type this in insert mode :

    html:5

Press the shortcut key in insert mode and your code will be like this

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

</body>
</html>
```

### Fix the indentation
> In normal mode

    <Leader>fi : Fix the indentation in all your file
        ==     : Fix the indentation of the selected line
> In visual mode

    = : Fix the indentation of the selected text

### Disable the highlight after research
    <C-h> : No Hightlight

### VIM LaTeX : Use VIM as your LaTeX IDE

If you want to compile your .tex file, just use this shortcut :

    <Leader>ll : Compile the .tex file into pdf
    <Leader>lv : Show the pdf viewer

You can see the official documentation about this plugin :
[*Here*](http://vim-latex.sourceforge.net/documentation/latex-suite.html)

> How I can compile a multiple files project ?

*Just create an empty file with the name of your main tex file + ".latexmain".
Exemple : If your main file is "main.tex", you'll create a file with this name :
"main.tex.latexmain".*

> How I can change the default output format ?

*Juste add this option in your .vimrc file*

    let g:Tex_DefaultTargetFormat = 'pdf'

*Note you can customize the format. By default is only dvi.*

> é doesn't work

*Just add these line in a new file called
"~/.vim/bundle/vim-latex/ftplugin/tex.vim"*

    imap <C-b> <Plug>Tex_MathBF
    imap <C-c> <Plug>Tex_MathCal
    imap <C-l> <Plug>Tex_LeftRight
    imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine

> How I can change the defaults multiple output format ?

*Juste add this option in your .vimrc file*

    let g:Tex_MultipleCompileFormats = 'dvi, aux'

*Note you can customize the format. By default is only 'dvi' and I set this option
on 'pdf, aux'.*

### Markdown Preview

> How to configure this plugin ?

It's very easy ! Just copy and paste this in your terminal :

    # apt-get install npm
    # npm -g install instant-markdown-d
    # apt-get install xdg-utils

* '#' means "Run this command as root"
* xdg-utils is installed by default on ubuntu
* I use the apt-get package manager but you can do it with yum, pacman and any
  package manager.

### NERDCommenter
> What is the shortcut ?

    <Leader>c<space>

* In normal mode, it will comment the current line.
* In visual mode, it will comment the selected block.

### NERDTree Shorcuts
    <Leader>e : NERDTree toggle
    <C-e>     : NERDTree find

### Numbers.vim
    <F3> : Toggle the numbers
    <F4> : Enable/Disable the numbers

### Paste shorcuts
    <Leader>p  : Enable the paste mode
    <Leader>np : Disable the paste mode

### Sparkup      : HTML ZenCoding
> How I can use this plugin ?

Write your code like this :

    html > body > h1 > div

Then execute sparkup in insert mode like this
> In insert mode

    <Leader>se : Execute sparkup
    <Leader>sn : Next mapping of sparkup

Now, your code is like this

```html
<html>
    <body>
        <h1>
            <div></div>
        </h1>
    </body>
</html>
```

### TagBar
    <Leader>tt : Toggle the tagbar

### Trailing space
> In normal mode

    <Leader>fs : Fix all the white spaces

> In visual mode

    <Leader>fs : Fix the white spaces over the selected text

### Undo tree
    <Leader>u : Toggle the undo tree

### Useful shortcut
    <C-s> : Save the current file
    <C-q> : Exit the file after a save

> If you want to exit without save your file

    :q!


## My Tmux Shortcuts :

> (In Building)
