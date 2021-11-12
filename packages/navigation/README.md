# Navigations

Source code for the navigation component, that distributed via jsDelivr.

## Motivation

Making our custom headers is a bit involved. We have to copy a lot of HTML code
into the scripts, and it's confusing and difficult to debug if something changes
and goes wrong, especially if our only text editor is the one built into
Squarespace.

Making the navigation in another component where you then import it is easier to debug and move around;
you copy less code between pages and the development process is better if you're
using something like VSCode.

We are using this folder to specifically host the desktop and mobile navigation component,
that goes inside `#headerNav` and `#sidecarNav` in the Squarespace page, respectively.

The header code in `public/index.html` is almost exactly what you'd see copy and
pasted into Squarespace (instead of importing the local `.js` file we use
[JSDelivr](https://www.jsdelivr.com/), and we need to add the contents in and [`styles.css`](./public/styles.css).

Note that we are using yarn workspaces, so the installations will be mostly consolidated at a top-level `.yarn` folder.

## Important

The [`site.css`](./public/site.css) is the squarespace compiled css, and the [`styles.css`](./public/styles.css) are our styles.

### Local Development

```bash
yarn
yarn start
```

Note that the styles will be quite a bit different than production, this is because I only copied a subset of the HTML into our `public/` html file. The important thing is that the navigation bar is functional.

### Production Build

This creates the `build/navigation.js` file that is ready to be distributed by the CDN.

```bash
yarn build
```

### Publish to NPM

Before you distribute it to CDN, you must publish it to NPM, where the javascript files will be hosted and read.
To do this, also refer to the `README.md` file at the root of the directory.

```bash
yarn changeset                      # To generate changesets
yarn changeset version              # To update the version number based off of changesets
yarn build                          # Build every project in the workspace
yarn changeset publish              # Publish to NPM
```

## Usage

### V2

In v2, only the import is needed.

```html
<script src="https://cdn.jsdelivr.net/npm/@e3c-summer-worker/navigation@2/build/navigation.js"></script>
```

### V1

```html
<script src="https://cdn.jsdelivr.net/npm/@e3c-summer-worker/navigation@1/build/mobilenav-elm.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@e3c-summer-worker/navigation@1/build/desktopnav-elm.js"></script>
<script>
    window.onload = function () {
        // desktop navigation
        const headerNav = document.getElementById('headerNav');
        const app_d = Elm.DesktopNav.init({ node: headerNav });

        // mobile navigation
        const sidecarNav = document.getElementById('sidecarNav');
        const app_m = Elm.MobileNav.init({ node: sidecarNav });
    }
</script>
```