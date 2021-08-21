# Homepage Ticker

Ticker for the home page, writen in Elm. Inspired by Rev. Doo, possibly implemented via [this thing](https://codepen.io/lewismcarey/pen/GJZVoG).

What it does is fetch the data from the deta micro server and display it in a simple HTML element.

It uses the deta micro server on the cloud, if you want to run it locally, you need to change the `url` in `src/HomepageTicker.elm`
to whatever you have the micro server running on (`http://localhost:3001` unless configured otherwise).

The data is located in a Google Spreadsheet at [this link](https://docs.google.com/spreadsheets/d/1E7MW3HpJJNEtByxD2Ej55V60q9OU13t7rGy_le5FcTo/edit?usp=sharing).

## Local Development

```bash
npm i
npm run start:elm

# in another terminal, run
npm run start:sass
```

## Production - WIP

Note that you'll need both the `homepage-ticker-elm.js` and the `ticker.css` files to be included.
