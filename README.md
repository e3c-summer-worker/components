# Components

A list of components (written mostly using React or Elm) that I am using for the
website.

Most of the directions for running locally and implementing them remotely are in the respective folders. 
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
yarn changeset
yarn changeset version # to update the version number
yarn changeset publish # publish
```
