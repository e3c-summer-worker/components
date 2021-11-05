# Navigations

Making our custom headers is a bit involved. We have to copy a lot of HTML code
into the scripts, and it's confusing and difficult to debug if something changes
and goes wrong, especially if our only text editor is the one built into
Squarespace.

Making the navigation in another component where you ethen import it is easier to debug and move around;
you copy less code between pages and the development process is better if you're
using something like VSCode.

We are using this folder to specifically host the desktop and mobile navigation component,
that goes inside `#headerNav` and `#sidecarNav` in the Squarespace page, respectively.

The header code in `public/index.html` is almost exactly what you'd see copy and
pasted into Squarespace (instead of importing the local `.js` file we use
[JSDelivr](https://www.jsdelivr.com/), and we need to add the contents in and [`styles.css`](./public/styles.css).

Note that we are using yarn workspaces, so the installations will be mostly consolidated at a top-level `node_modules/` folder.

## Important

The [`site.css`](./public/site.css) is the squarespace compiled css, and the [`styles.css`](./public/styles.css) are our styles.

## Local Development

```bash
yarn
yarn start

# for minification:
yarn build
```
