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

To build for production, run the following command:

```bash
yarn build
```

## Usage

```html
<script>
    const containerElement = document.getElementById('thumbnail');
    new p5(TerrainSketch.sketch(containerElement), containerElement);
</script>
```