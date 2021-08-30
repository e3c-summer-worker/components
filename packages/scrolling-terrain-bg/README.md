# Scrolling Terrain

Based off of [p5-typescript-starter](https://github.com/Gaweph/p5-typescript-starter).

Note that we are using yarn workspaces, so the installations will be mostly consolidated at a top-level `node_modules/` folder.

## Run Locally

```bash
yarn
yarn start
```

Then start a local server and go to index.html to see the results.

## Production

GIthub actions **will** be used to deploy to production. You can then access the files with jsdelivr on this link:
[https://cdn.jsdelivr.net/npm/scrolling-terrain-bg@1.2.0/build/scrolling-terrain.min.js](https://cdn.jsdelivr.net/npm/@e3c-summer-worker/scrolling-terrain-bg/build/scrolling-terrain.min.js).

**DEPRECATED**: I'm moving to npm and fastly there. The versioning with npm is much better.

Github actions should automatically compile the code and upload it to the `scrolling-terrain` branch where you can access it via a cdn.
I use [jsdelivr](https://www.jsdelivr.com/) for this.

To access the latest file, you can use the following link:
You may want to lock a version number in production! Otherwise any pushes to `main` will overwrite the latest version.
[https://cdn.jsdelivr.net/gh/e3c-summer-worker/components@scrolling-terrain/scrolling-terrain.min.js](https://cdn.jsdelivr.net/gh/e3c-summer-worker/components@scrolling-terrain/scrolling-terrain.min.js).
