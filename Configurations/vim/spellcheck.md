# Spell checking in Vim

Vim support spell checking.

To enable it add these lines into your **.vimrc**  

```
map <silent> <F7> "<Esc>:silent setlocal spell! spelllang=en<CR>"
map <silent> <F6> "<Esc>:silent setlocal spell! spelllang=fr<CR>"
```

## French correction

1. Create a spell folder inside your Vim directory
2. Go inside and download these files

```
wget http://ftp.vim.org/vim/runtime/spell/fr.latin1.spl
wget http://ftp.vim.org/vim/runtime/spell/fr.latin1.sug
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug
```

## Keybindings

- ***z=*** Check the word.
- ***zg*** Add the misspelled word in the dictionary.
- ***zug*** Undo the addition of the word in the dictionary.
- ***]s*** Go to the next misspelled word.
- ***[s*** Go to the previous misspelled word.

## Disable it

Just write **:set nospell**
