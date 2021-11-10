# Components

A list of components (written mostly using React or Elm) that I am using for the website. The code is bundled, then hosted on NPM, where it is served by JSDelivr's CDN. For more information on using them, check out the [Custom Header repo](https://github.com/e3c-summer-worker/custom-header).

I am using [Yarn Workspaces](https://yarnpkg.com/features/workspaces) and [changesets](https://github.com/atlassian/changesets/blob/main/packages/cli/README.md) for versioning.

This repo structure is based off of [monorepo-release-changesets](https://github.com/azu/monorepo-release-changesets).

## Overview of the components

All the components are in the `packages/*` folder, save for the `elm-webpack-loader`, which is there to fix an unfortunate bug in the Elm webpack compiler.

* Homepage Ticker (`packages/homepage-ticker`)
* Navigation (`packages/navigation`)
* Scrolling Terrain (`packages/scrolling-terrain`)

## Local development

Make sure you have the following installed:

* [Yarn 3](https://yarnpkg.com/)

I'm using Yarn's [Plug'n'Play](https://yarnpkg.com/features/pnp) as my dependency management system, so theoretically you don't even need to run `yarn install` (but maybe run it anyway?). The dependencies should all be in the `.pnp.cjs` file. The benefit of this is that installations are generally super fast, but the git diffs can get pretty crazy. If anything goes wrong, you shoudl be able to fix it by reinstalling the packages: 

```bash
yarn
```

### Updating Versions

I should really automate this in GH Actions, but I'm too smooth brained to do that right now.

```bash
yarn changeset         # To generate changesets
yarn changeset version # To update the version number based off of changesets
yarn changeset publish # Publish to NPM
```
