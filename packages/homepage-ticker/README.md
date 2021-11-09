# Homepage Ticker

Ticker for the home page, writen in Elm. Inspired by Rev. Doo, possibly implemented via [this thing](https://codepen.io/lewismcarey/pen/GJZVoG).

What it does is fetch the data from the deta micro server and display it in a simple HTML element.

It uses the deta micro server on the cloud, if you want to run it locally, you need to change the `url` in `src/HomepageTicker.elm`
to whatever you have the micro server running on (`http://localhost:3001` unless configured otherwise).

The data is located in a Google Spreadsheet at [this link](https://docs.google.com/spreadsheets/d/1E7MW3HpJJNEtByxD2Ej55V60q9OU13t7rGy_le5FcTo/edit?usp=sharing).

Note that we are using yarn workspaces, so the installations will be mostly consolidated at a top-level `node_modules/` folder.

## Local Development

```bash
yarn
yarn start
```

This will watch the files in `src/` and rebuild `build/ticker.js` whenever they change.

Open a local dev server to host the html in the `public/` folder. I use [Five Server](https://marketplace.visualstudio.com/items?itemName=yandeu.five-server) to do this. NOTE: make sure the url ends in `index.html`, otherwise the server will not serve the files correctly.

## Production

```bash
yarn build
```
The live server can also be used to test that the compiled code is working.

The distributed files will be in the `build/` folder (`ticker.js`, and `ticker.css`).
