# Firefox

## Fix bad font rendering

Websites use a font called "Helvetica". Unlikely, this font cost a lot of money
and don't come with Firefox. The solution is simple! Do what Chromium's doing. Replace Helvetica with the font that you want. I choose Roboto, like Chromium ([Roboto download link](https://fonts.google.com/selection?selection.family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i)). To do this, install the Stylish extension for Firefox: [Click here to download](https://addons.mozilla.org/en-US/firefox/addon/stylish/)

Add a new global style with the name that you want. I called it "Fix helvetica".
Put this css code inside:

```
@font-face { font-family: 'helvetica'; src: local('Roboto'); }
```

And it's done!
