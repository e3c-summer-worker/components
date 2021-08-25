# Components

A list of components (written mostly using React or Elm) that I am using for the
website.

Most of the directions for running locally and implementing them remotely are in the respective folders. 
I am using [Yarn Workspaces](https://classic.yarnpkg.com/en/docs/workspaces/) and [changesets](https://github.com/atlassian/changesets/blob/main/packages/cli/README.md) for versioning.

Since we are using yarn workspaces, so the installations will be mostly consolidated at the top-level `node_modules/` folder, with some extra binaries in each workspace. You can run `yarn install` in each workspace to install the dependencies for that workspace; it will automatically download the dependencies in the root `node_modules/` folder if it does not find them.

## Production

Most of the components have an associated Github Action that pushes it to a new branch, where you can then access it via a CDN, like jsDelivr (which is what I'm using primarily).

Some pages on Squarespace may still use jsDelivr links in the [SummerWorkerECCC.github.io](https://github.com/SummerWorkerECCC/SummerWorkerECCC.github.io) repository (I used to manually add the compiled code to the repo very time I made new changes), which I have kept there for backward compatibility.
ersions


### Updating Versions

```bash
yarn changeset
```