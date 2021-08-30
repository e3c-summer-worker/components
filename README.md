# Components

A list of components (written mostly using React or Elm) that I am using for the
website.

Most of the directions for running locally and implementing them remotely are in the respective folders. 
I am using [Yarn Workspaces](https://yarnpkg.com/features/workspaces) and [changesets](https://github.com/atlassian/changesets/blob/main/packages/cli/README.md) for versioning.

## Local development

Make sure you have the following installed:

* [Yarn 3](https://yarnpkg.com/)

I'm using Yarn's [Plug'n'Play](https://yarnpkg.com/features/pnp) as my dependency maangemeny system, so theoretically you don't even need to run `yarn install` (but maybe run it anyway?). The dependencies should all be in the `.pnp.cjs` file.

## Production

Most of the components have an associated Github Action that pushes it to a new branch, where you can then access it via a CDN, like jsDelivr (which is what I'm using primarily).

Some pages on Squarespace may still use jsDelivr links in the [SummerWorkerECCC.github.io](https://github.com/SummerWorkerECCC/SummerWorkerECCC.github.io) repository (I used to manually add the compiled code to the repo very time I made new changes), which I have kept there for backward compatibility.
ersions

### Updating Versions

I should really automate this in GH Actions, but I'm too smooth brained to do that right now.

```bash
yarn changeset
yarn changeset version # to update the version number
yarn changeset publish # publish
```
