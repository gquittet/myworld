# Firefox

## Fix bad font rendering

Websites use a font called "Helvetica". Unlikely, this font cost a lot of money
and it isn't in Firefox. The solution is simple! Do what Chromium do. Install
Stylish extension for Firefox: [Click here to download](https://addons.mozilla.org/en-US/firefox/addon/stylish/)

Add a new global style with the name that you want. I called it "Fix helvetica".
Put this css code inside:

```
@font-face { font-family: 'helvetica'; src: local('Roboto'); }
```

And it's done!
