# How to configure gist for Emacs

## Go to github

Go to Settings -> Developper Settings -> Personal access tokens

## Generate new token

- Click on this button
- Type a description (example: Gist emacs token)
- Select "gist"
- Click on "Generate token"

## Edit your git global settings

```
git config --global github.user username
git config --global github.oauth-token thesuperlongtokennumber
```
