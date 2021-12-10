# Components

A list of components (written mostly using React or Elm) that I am using for the website. The code is bundled, then hosted on NPM, where it is served by JSDelivr's CDN. For more information on using them, check out the [Custom Header repo](https://github.com/e3c-summer-worker/custom-header).

This repo structure is based off of [monorepo-release-changesets](https://github.com/azu/monorepo-release-changesets).

## Updating Versions

If you are on this repo, you probably want to update something in this repo.

We have automated the versioning and the NPM publishing on Github actions. If you want to experiment with the setup without messing up the NPM versioning in this repo, take a look at the [Changeet Actions Test Repo](https://github.com/e3c-summer-worker/changeset-actions-test).

**Make sure you are at the root of the repo**.

```bash
# make your changes, but DO NOT commit yet
yarn changeset                      # To generate changesets
# Now we commit the changes with the changeset
git add .
git commit -m "Update components"   # change the commit message
git push origin main                # push the changes to the repo
```

### Case 1: Commiting right to the main branch

The GH actions will automatically create a PR that has the versions updated. You would then have to merge the PR yourself, which the GH actions will then publish the changes to NPM.

### Case 2: Commiting to a different branch

You should be committing changesets while you are on the branch, preferably alongside your code changes.

When you merge the PR, the GH actions will do the same things as the first case: create the PR with the versions updated, and once you merge that PR, it will publish the changes to NPM.

## Overview of the components

All the components are in the `packages/*` folder, save for the `elm-webpack-loader`, which is there to fix an unfortunate bug in the Elm webpack compiler.

- Homepage Ticker (`packages/homepage-ticker`)
- Navigation (`packages/navigation`)
- Scrolling Terrain (`packages/scrolling-terrain`)

## Local development

Make sure you have the following installed:

- [Yarn 3](https://yarnpkg.com/)
- [Elm](https://elm-lang.org/)
- [Node v16](https://nodejs.org/)

**NOTE**: Using node v17 somehow [messed up yarn build](https://stackoverflow.com/a/69789658). Node v16 seems to fix it.

```bash
yarn
```

I'm using Yarn's [Plug'n'Play](https://yarnpkg.com/features/pnp) as my dependency management system, so theoretically you don't even need to run `yarn` (but maybe run it anyway?). The dependencies should all be in the `.pnp.cjs` file. The benefit of this is that installations are generally super fast, but the git diffs can get pretty crazy. If anything goes wrong, you should be able to fix it by reinstalling the packages:

## Usage

To use the components, you must [inject custom code in the Squarespace page header](https://support.squarespace.com/hc/en-us/articles/205815908-Using-Code-Injection) (`Page settings -> Advanced -> Page Header Code Injection`). More details are in each component's README.
