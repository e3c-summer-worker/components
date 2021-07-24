# Server

This holds the code that is essentially the middleman b/w the Google Sheets API and the client.

The endpoint is at [https://4y7qfk.deta.dev](https://4y7qfk.deta.dev).

## Local Development

```bash
nvm use
npm install
npm start
```

This will start nodemon to watch the typescript files on `localhost:3001`. You can configure it in `run.ts`, or with an environment variable.

## Deployment

```bash
npm run tsc
deta deploy
```

Ensure you have the Deta CLI installed and logged in with `deta login` to the ECCC account.
