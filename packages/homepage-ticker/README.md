# Homepage Ticker

Ticker for the home page, writen in Elm and directed by Rev. Doo.

What it does is fetch the data from the deta micro server and display it in a simple HTML element.

It uses a [Deta Micro server](https://docs.deta.sh/docs/micros/about/) for the HTTP endpoint, which is a free cloud service built on AWS. The data is located in a Google Spreadsheet at [this link](https://docs.google.com/spreadsheets/d/1E7MW3HpJJNEtByxD2Ej55V60q9OU13t7rGy_le5FcTo/edit?usp=sharing). The code handling this logic resides in [this repository](https://github.com/e3c-summer-worker/google-sheets).

On the Deta web view, the project is under `sheets-api`. Note that the project is not `homepage-ticker`, that was an old one that should be deleted, but Deta doesn't allow project deletions yet!

## Local Development

```bash
yarn
yarn start
```

This will watch the files in `src/` and rebuild `build/ticker.js` whenever they change.

Open a local dev server to host the html in the `public/` folder to see the result. I use [Five Server](https://marketplace.visualstudio.com/items?itemName=yandeu.five-server) to do this. NOTE: make sure the url ends in `public/index.html`, otherwise the server will not serve the files correctly.

## Production

```bash
yarn build
```

The live server can also be used to test that the compiled code is working.

The distributed files will be in the `build/` folder (`ticker.js` and `ticker.css`).
